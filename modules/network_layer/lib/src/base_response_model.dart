import '../utils/helpers/typedef.dart';

class ResponseModel<T> {
  final ResponseHeadersModel headers;
  final T body;

  const ResponseModel({
    required this.headers,
    required this.body,
  });

  factory ResponseModel.fromJson(JSON? headers, dynamic data) {
    return ResponseModel(
      headers: ResponseHeadersModel.fromJson(
        headers as JSON,
      ),
      body: data as T,
    );
  }
}

//the way the backend is constructed I don't find any need for the headers,
//there are not any info on error, message or code in them, and previously they were
//supposed to come from the response.data, but the response.data is the actual body of the response
class ResponseHeadersModel {
  final bool error;
  final String message;
  final String? code;

  const ResponseHeadersModel({
    required this.error,
    required this.message,
    this.code,
  });

  factory ResponseHeadersModel.fromJson(JSON json) {
    return ResponseHeadersModel(
      error: false,
      message: json['message'] != null ? json['message'] as String : "",
      code: json['code'] as String?,
    );
  }
}
