import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const String _BASIC_URL = "https://api.adviceslip.com/advice";

final dioApiServiceProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(
      baseUrl: _BASIC_URL,
      receiveTimeout: Duration(seconds: 8),
      sendTimeout: Duration(seconds: 5),
      connectTimeout: Duration(seconds: 13),
    ),
  ),
);
