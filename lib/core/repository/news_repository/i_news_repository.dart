import 'package:dartz/dartz.dart';
import 'package:endpoint_layer/utils/constants/auth_endpoint.dart';
import 'package:network_layer/utils/exceptions/custom_exception.dart';
import 'package:worldtimes/core/models/news_response_model.dart';

abstract class INewsRepository {
  Future<Either<NewsResponseModel, CustomException>> getNews({
    required NewsEndpoints type,
    Map<String, dynamic>? queryParams,
  });
}
