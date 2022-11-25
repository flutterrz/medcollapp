import 'package:dio/dio.dart';

extension StringExtensions on String {
  String toNormalCase() {
    try {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } catch (e) {
      return this;
    }
  }
}

extension DioResponseExtension on Response {
  bool get isSuccess {
    final statusCode = this.statusCode ?? 0;
    return this.statusCode! >= 200 && statusCode < 300;
  }
}
