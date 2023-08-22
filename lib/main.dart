import 'package:flutter/material.dart';
import 'package:qr_scan/di/di.dart';
import 'package:qr_scan/presentation/app.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

