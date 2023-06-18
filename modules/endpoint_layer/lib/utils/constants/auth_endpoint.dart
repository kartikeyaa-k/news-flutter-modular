/// A collection of endpoints used for authentication purposes.
enum NewsEndpoints {
  all,
  topHeadlines,
}

class NewsEndpointsClient {
  static const basePath = '/v1/news';
  static const allNews = '/all';
  static const getTopHeadlines = '/top';
}
