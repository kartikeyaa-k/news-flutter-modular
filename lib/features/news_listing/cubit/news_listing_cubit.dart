import 'dart:async';
import 'package:endpoint_layer/utils/constants/auth_endpoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldtimes/core/constants/app_constants.dart';
import 'package:worldtimes/core/models/news_response_model.dart';
import 'package:worldtimes/core/repository/news_repository/i_news_repository.dart';
import 'package:worldtimes/features/news_listing/cubit/news_listing_state.dart';

class NewsListingCubit extends Cubit<NewsListingState> {
  final INewsRepository repository;
  NewsListingCubit({
    required this.repository,
  }) : super(const NewsListingState());

  List<NewsData> news = [];

  Future<void> getNews({
    bool loadFromCache = true,
  }) async {
    try {
      emit(
        state.copyWith(
          status: NewsListingStateStatus.loading,
          news: news,
        ),
      );
      if (loadFromCache && news.isNotEmpty) {
        emit(
          state.copyWith(
            status: NewsListingStateStatus.loaded,
            news: news,
          ),
        );
        return;
      }
      Map<String, dynamic> queryParams = {
        "limit": 10,
        "page": state.currentPageIndex,
        "api_token": devNewsApiToken,
      };

      var res = await repository.getNews(
        type: NewsEndpoints.topHeadlines,
        queryParams: queryParams,
      );

      res.fold((success) {
        news.clear();
        news.addAll(success.newsData);
        emit(
          state.copyWith(
            status: NewsListingStateStatus.loaded,
            news: news,
            currentPageIndex: success.meta.page,
          ),
        );
      }, (error) {
        emit(
          state.copyWith(
            status: NewsListingStateStatus.failed,
            errorMessage: error.message,
          ),
        );
      });
    } catch (e) {
      emit(
        state.copyWith(
            status: NewsListingStateStatus.failed,
            errorMessage: 'Something went wrong!'),
      );
    }
  }

  Future<void> getMoreNews() async {
    try {
      emit(state.copyWith(
        status: NewsListingStateStatus.loadingMoreData,
      ));
      Map<String, dynamic> queryParams = {
        "limit": 10,
        "page": state.currentPageIndex + 1,
        "api_token": devNewsApiToken,
      };
      var res = await repository.getNews(
        type: NewsEndpoints.topHeadlines,
        queryParams: queryParams,
      );
      res.fold((success) {
        if (success.newsData.isEmpty) {
          emit(
            state.copyWith(
              status: NewsListingStateStatus.noMoreData,
              news: news,
            ),
          );
          return;
        }

        news.addAll(success.newsData);
        emit(
          state.copyWith(
            status: NewsListingStateStatus.loaded,
            news: news,
            currentPageIndex: success.meta.page,
          ),
        );
      }, (error) {
        emit(
          state.copyWith(
            status: NewsListingStateStatus.failed,
            errorMessage: error.message,
          ),
        );
      });
    } catch (e) {
      emit(
        state.copyWith(
          status: NewsListingStateStatus.failed,
          errorMessage: 'Something went wrong!',
        ),
      );
    }
  }
}
