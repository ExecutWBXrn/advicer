import 'package:dio/dio.dart';

String mapBadResponse(DioException error) {
  final statusCode = error.response?.statusCode;

  switch (statusCode) {
    case 400:
      return 'Bad request. Please check your input.';
    case 401:
      return 'Unauthorized. Please sign in again.';
    case 403:
      return 'Access denied.';
    case 404:
      return 'Resource not found.';
    case 409:
      return 'Conflict occurred. Please try again.';
    case 422:
      return 'Invalid data provided.';
    case 429:
      return 'Too many requests. Try again later.';
    case 500:
      return 'Server error. Please try again later.';
    case 502:
      return 'Bad gateway. Server is unavailable.';
    case 503:
      return 'Service temporarily unavailable.';
    default:
      return 'Server error occurred. Please try again.';
  }
}
