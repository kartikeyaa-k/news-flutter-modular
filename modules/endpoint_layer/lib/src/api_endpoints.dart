import 'package:flutter/foundation.dart';

import '../utils/constants/auth_endpoint.dart';
import '../utils/env_config/env_config.dart';

/// A utility class for getting paths for API endpoints.
/// This class has no constructor and all methods are `static`.
@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  /// The base url of our REST API, to which all the requests will be sent.
  /// It is supplied at the time of building the apk or running the app:
  /// ```
  /// flutter build apk --debug --dart-define=BASE_URL=www.some_url.com
  /// ```
  /// OR
  /// ```
  /// flutter run --dart-define=BASE_URL=www.some_url.com
  /// ```
  static const baseUrl = EnvironmentConfig.baseUrl;

  /// Returns the path for an authentication [endpoint].
  static String news(NewsEndpoints endpoint) {
    switch (endpoint) {
      case NewsEndpoints.topHeadlines:
        return baseUrl +
            NewsEndpointsClient.basePath +
            NewsEndpointsClient.getTopHeadlines;
      case NewsEndpoints.all:
        return baseUrl +
            NewsEndpointsClient.basePath +
            NewsEndpointsClient.allNews;
    }
  }
}
