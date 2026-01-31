import 'package:dio/dio.dart';
import './bad_response_to_message_mapper.dart';

String mapDioExceptionToMessage(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return 'Connection timed out. Please try again.';

    case DioExceptionType.sendTimeout:
      return 'Request timeout. Please try again.';

    case DioExceptionType.receiveTimeout:
      return 'Server response timeout. Please try again later.';

    case DioExceptionType.badCertificate:
      return 'Security error. Invalid server certificate.';

    case DioExceptionType.cancel:
      return 'Request was cancelled.';

    case DioExceptionType.connectionError:
      return 'No internet connection. Check your network.';

    case DioExceptionType.badResponse:
      return mapBadResponse(error);

    case DioExceptionType.unknown:
    default:
      return 'Unexpected error occurred. Please try again.';
  }
}
