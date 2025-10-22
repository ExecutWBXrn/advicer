import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: Duration(seconds: 8),
      sendTimeout: Duration(seconds: 5),
      connectTimeout: Duration(seconds: 13),
    ),
  );
  static const String baseUrl = "https://api.adviceslip.com/advice";

  Dio getDio() {
    return _dio;
  }
}

final dioApiServiceProvider = Provider<DioApiService>((ref) => DioApiService());
