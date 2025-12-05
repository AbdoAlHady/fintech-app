import 'package:fintech_app/app.dart';
import 'package:fintech_app/core/helpers/cache_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const FintechApp());
}
