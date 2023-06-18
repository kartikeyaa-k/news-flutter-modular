import 'package:dartz/dartz.dart';
import 'package:endpoint_layer/utils/constants/auth_endpoint.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:network_layer/utils/exceptions/custom_exception.dart';
import 'package:worldtimes/core/constants/app_constants.dart';
import 'package:worldtimes/features/news_listing/cubit/news_listing_cubit.dart';
import 'package:worldtimes/features/news_listing/cubit/news_listing_state.dart';

import '../shared_mocks.mocks.dart';

void main() {
  late final MockINewsRepository mockINewsRepository;
  late final MockNewsResponseModel mockNewsResponseModel;
  late final MockMeta mockMeta;

  setUpAll(() {
    mockINewsRepository = MockINewsRepository();
    mockNewsResponseModel = MockNewsResponseModel();
    mockMeta = MockMeta();
  });

  group('New Listing Cubit Unit Tests : ', () {
    late NewsListingCubit cubit;

    setUp(() {
      cubit = NewsListingCubit(repository: mockINewsRepository);
    });

    blocTest<NewsListingCubit, NewsListingState>(
      '''emits status = NewsListingStateStatus.loaded with news 
      when network response is successful.''',
      build: () {
        when(mockINewsRepository.getNews(
          type: NewsEndpoints.topHeadlines,
          queryParams: {
            "limit": 10,
            "page": 1,
            "api_token": devNewsApiToken,
          },
        )).thenAnswer((_) async => Future.value(Left(
              mockNewsResponseModel,
            )));

        when(mockNewsResponseModel.newsData).thenReturn([]);
        when(mockNewsResponseModel.meta).thenReturn(mockMeta);
        when(mockMeta.page).thenReturn(1);
        when(mockMeta.limit).thenReturn(3);

        return cubit;
      },
      act: (cubit) async => await cubit.getNews(loadFromCache: false),
      expect: () => [
        const NewsListingState(
            status: NewsListingStateStatus.loading,
            news: [],
            currentPageIndex: 1,
            errorMessage: null),
        NewsListingState(
            status: NewsListingStateStatus.loaded,
            news: mockNewsResponseModel.newsData,
            currentPageIndex: mockMeta.page,
            errorMessage: null),
      ],
    );

    blocTest<NewsListingCubit, NewsListingState>(
      '''emits status = NewsListingStateStatus.failed with news 
      when network response fails.''',
      build: () {
        when(mockINewsRepository.getNews(
          type: NewsEndpoints.topHeadlines,
          queryParams: {
            "limit": 10,
            "page": 1,
            "api_token": devNewsApiToken,
          },
        )).thenAnswer((_) async => Future.value(
            Right(CustomException(message: 'Something went wrong!'))));

        when(mockNewsResponseModel.newsData).thenReturn([]);
        when(mockNewsResponseModel.meta).thenReturn(mockMeta);
        when(mockMeta.page).thenReturn(1);
        when(mockMeta.limit).thenReturn(3);

        return cubit;
      },
      act: (cubit) async => await cubit.getNews(loadFromCache: false),
      expect: () => [
        const NewsListingState(
            status: NewsListingStateStatus.loading,
            news: [],
            currentPageIndex: 1,
            errorMessage: null),
        const NewsListingState(
            status: NewsListingStateStatus.failed,
            news: [],
            currentPageIndex: 1,
            errorMessage: 'Something went wrong!'),
      ],
    );
  });
}
