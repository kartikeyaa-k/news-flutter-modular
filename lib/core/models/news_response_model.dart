class NewsResponseModel {
  NewsResponseModel({
    required this.meta,
    required this.newsData,
  });
  late final Meta meta;
  late final List<NewsData> newsData;

  NewsResponseModel.fromJson(Map<String, dynamic> json) {
    meta = Meta.fromJson(json['meta']);
    newsData =
        List.from(json['data']).map((e) => NewsData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['meta'] = meta.toJson();
    data['data'] = newsData.map((e) => e.toJson()).toList();
    return data;
  }
}

class Meta {
  Meta({
    required this.found,
    required this.returned,
    required this.limit,
    required this.page,
  });
  late final int found;
  late final int returned;
  late final int limit;
  late final int page;

  Meta.fromJson(Map<String, dynamic> json) {
    found = json['found'];
    returned = json['returned'];
    limit = json['limit'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['found'] = found;
    data['returned'] = returned;
    data['limit'] = limit;
    data['page'] = page;
    return data;
  }
}

class NewsData {
  NewsData({
    required this.uuid,
    required this.title,
    required this.description,
    required this.keywords,
    required this.snippet,
    required this.url,
    required this.imageUrl,
    required this.language,
    required this.publishedAt,
    required this.source,
    required this.categories,
    this.relevanceScore,
    required this.locale,
  });
  late final String uuid;
  late final String title;
  late final String description;
  late final String keywords;
  late final String snippet;
  late final String url;
  late final String imageUrl;
  late final String language;
  late final String publishedAt;
  late final String source;
  late final List<String> categories;
  late final String? relevanceScore;
  late final String locale;

  NewsData.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    description = json['description'];
    keywords = json['keywords'];
    snippet = json['snippet'];
    url = json['url'];
    imageUrl = json['image_url'];
    language = json['language'];
    publishedAt = json['published_at'];
    source = json['source'];
    categories = List.castFrom<dynamic, String>(json['categories']);
    relevanceScore = json['relevance_score'];
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['title'] = title;
    data['description'] = description;
    data['keywords'] = keywords;
    data['snippet'] = snippet;
    data['url'] = url;
    data['image_url'] = imageUrl;
    data['language'] = language;
    data['published_at'] = publishedAt;
    data['source'] = source;
    data['categories'] = categories;
    data['relevance_score'] = relevanceScore;
    data['locale'] = locale;
    return data;
  }
}
