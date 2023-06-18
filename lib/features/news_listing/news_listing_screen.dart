import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:worldtimes/core/theme/pagination/pagination_custom_footer.dart';
import 'package:worldtimes/core/theme/pagination/pull_to_refresh_custom_header.dart';
import 'package:worldtimes/core/utils/custom_grid/custom_grid_fixed_height.dart';
import 'package:worldtimes/core/utils/custom_navigation/navigator_transition.dart';
import 'package:worldtimes/features/news_details/news_details_screen.dart';
import 'package:worldtimes/features/news_listing/components/news_component.dart';
import 'package:worldtimes/features/news_listing/components/news_failed_component.dart';
import 'package:worldtimes/features/news_listing/components/news_loading_component.dart';
import 'package:worldtimes/features/news_listing/cubit/news_listing_cubit.dart';
import 'package:worldtimes/features/news_listing/cubit/news_listing_state.dart';

class NewsListingScreen extends StatefulWidget {
  const NewsListingScreen({
    super.key,
  });

  @override
  State<NewsListingScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<NewsListingScreen>
    with WidgetsBindingObserver {
  late NewsListingCubit _newsListingCubit;
  late RefreshController _refreshController;

  @override
  void initState() {
    _newsListingCubit = BlocProvider.of<NewsListingCubit>(context);

    /// Controller used for pull to refresh
    /// and also for pagination
    _refreshController = RefreshController(
      initialRefresh: false,
      initialRefreshStatus: RefreshStatus.idle,
      initialLoadStatus: LoadStatus.idle,
    );

    /// Type of news can be sent from the UI
    /// For this demo we will just load all news
    _newsListingCubit.getNews(loadFromCache: false);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _newsListingCubit.getNews(loadFromCache: true);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0.0,
        title: Transform(
          transform: Matrix4.translationValues(12.0, 0.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Top Headlines',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(letterSpacing: -0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocConsumer<NewsListingCubit, NewsListingState>(
              listener: (context, state) {
            if (state.status == NewsListingStateStatus.loaded) {
              _refreshController.refreshCompleted();
              _refreshController.loadComplete();
            } else if (state.status == NewsListingStateStatus.noMoreData) {
              _refreshController.loadNoData();
            }
          }, builder: (context, state) {
            if (state.status == NewsListingStateStatus.init ||
                state.status == NewsListingStateStatus.loading) {
              return const NewsLoadingComponent();
            } else if (state.news != null) {
              return SmartRefresher(
                enablePullUp: true,
                cacheExtent: 500,
                controller: _refreshController,
                header: const PullToRefreshCustomHeader(),
                footer: const PaginationCustomFooter(),
                onLoading: () async {
                  _newsListingCubit.getMoreNews();
                },
                onRefresh: () async {
                  _newsListingCubit.getNews(loadFromCache: false);
                },
                child: state.status == NewsListingStateStatus.failed
                    ? NewsFailedComponent(
                        errorMessage:
                            state.errorMessage ?? 'Something went wrong!')
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Pull to refresh',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            GridView.builder(
                              addAutomaticKeepAlives: false,
                              addRepaintBoundaries: false,
                              shrinkWrap: true,
                              cacheExtent: 500,
                              physics: const BouncingScrollPhysics(),

                              /// Null check taken care above
                              itemCount: state.news!.length,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 5,
                                height: 240,
                              ),
                              itemBuilder: (context, index) {
                                /// Null check taken care above
                                /// And state will always emit empty array instead of null
                                var news = state.news![index];

                                return InkWell(
                                  child: NewsComponent(
                                    title: news.title,
                                    description: news.description,
                                    imgURL: news.imageUrl,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CustomPageRoute(
                                            builder: (_) => NewsDetails(
                                                  id: news.uuid,
                                                  imageUrl: news.imageUrl,
                                                )));
                                  },
                                );
                              },
                            ),
                            if (state.status == NewsListingStateStatus.loaded)
                              Container(
                                padding:
                                    const EdgeInsets.only(bottom: 30, left: 0),
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  'Swipe up to load more',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            if (state.status ==
                                NewsListingStateStatus.loadingMoreData)
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Center(
                                    child: CupertinoActivityIndicator(),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                ],
                              )
                          ],
                        ),
                      ),
              );
            }

            return const SizedBox();
          });
        },
      ),
    );
  }
}
