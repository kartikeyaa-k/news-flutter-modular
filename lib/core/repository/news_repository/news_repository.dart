import 'package:endpoint_layer/utils/constants/auth_endpoint.dart';
import 'package:network_layer/api_service.dart';
import 'package:endpoint_layer/endpoint_layer.dart';
import 'package:dartz/dartz.dart';
import 'package:network_layer/utils/exceptions/custom_exception.dart';
import 'package:worldtimes/core/models/news_response_model.dart';
import 'package:worldtimes/core/repository/news_repository/i_news_repository.dart';

class NewsRepository implements INewsRepository {
  ApiService apiService;
  NewsRepository(this.apiService);

  @override
  Future<Either<NewsResponseModel, CustomException>> getNews({
    required NewsEndpoints type,
    Map<String, dynamic>? queryParams,
  }) async {
    final res = await apiService
        .getCollectionData<Either<NewsResponseModel, CustomException>>(
      endpoint: ApiEndpoint.news(type),
      queryParams: queryParams,
      requiresAuthToken: false,
      converter: successGetBooks,
      errorHandler: errorHandlerGetBooks,
    );

    return res;
  }

  Either<NewsResponseModel, CustomException> successGetBooks(dynamic resBody) {
    final result = NewsResponseModel.fromJson(resBody);
    return Left(result);
  }

  Either<NewsResponseModel, CustomException> errorHandlerGetBooks(
      CustomException errBody) {
    return Right(errBody);
  }
}
