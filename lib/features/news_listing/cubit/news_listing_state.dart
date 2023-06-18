import 'package:equatable/equatable.dart';
import 'package:worldtimes/core/models/news_response_model.dart';

enum NewsListingStateStatus {
  init,
  loading,
  loaded,
  failed,
  loadingMoreData,
  noMoreData,
}

class NewsListingState extends Equatable {
  final NewsListingStateStatus? status;
  final List<NewsData>? news;
  final int currentPageIndex;
  final String? errorMessage;

  const NewsListingState({
    this.status = NewsListingStateStatus.init,
    this.news,
    this.currentPageIndex = 1,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        news,
        currentPageIndex,
        errorMessage,
      ];

  NewsListingState copyWith({
    NewsListingStateStatus? status,
    List<NewsData>? news,
    int? currentPageIndex,
    String? errorMessage,
  }) {
    return NewsListingState(
      status: status ?? this.status,
      news: news ?? this.news,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
