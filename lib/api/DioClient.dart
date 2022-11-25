import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import '../constants/APIConstants.dart';

class DioClient {
  static Dio? _dio;

  static Dio get client {
    return Get.find<Dio>();
  }

  static init() {
    _dio ??= Dio(BaseOptions(
      baseUrl: APIConstants.BASE_URL,
      validateStatus: (status) {
        return status! <= 500;
      },
      headers: {'Accept': 'application/json'},
    ));
    Get.put(_dio!, permanent: true);
  }
}

Future<void> showError(error, {VoidCallback? onRetry}) async {
  String title = "Error";
  String message = error?.toString() ?? "Something went wrong";
  if (error is DioError) {
    if ((error.error is SocketException) || (error.error is HttpException)) {
      message = "Please check your internet connection.";
    }
  }
  showMessage(title, message);
}

Future<void> showMessage(String title, String message) async {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(12),
      backgroundColor: Colors.black87,
      colorText: Colors.white);
}
