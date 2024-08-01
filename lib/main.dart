import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';

late PackageInfo packageInfo;

var dio = Dio(BaseOptions(
    baseUrl: 'https://dummyjson.com/',
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(milliseconds: 60000)));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  packageInfo = await PackageInfo.fromPlatform();
  dio.interceptors.add(CustomDioInterceptor());
  runApp(ProviderScope(observers: [AppObserver()], child: const Application()));
}
