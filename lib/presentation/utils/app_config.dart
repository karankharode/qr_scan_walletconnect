import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

class AppConfig {
  // Singleton setup
  static final AppConfig _singleton = AppConfig._internal();
  factory AppConfig() => _singleton;
  AppConfig._internal();

}
