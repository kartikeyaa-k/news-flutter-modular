import 'package:mockito/annotations.dart';
import 'package:worldtimes/core/models/news_response_model.dart';
import 'package:worldtimes/core/repository/news_repository/i_news_repository.dart';

@GenerateMocks([
// Repository
  INewsRepository,
// Models
  NewsResponseModel,
  Meta,
  Exception,
], customMocks: [])
void main() {}
