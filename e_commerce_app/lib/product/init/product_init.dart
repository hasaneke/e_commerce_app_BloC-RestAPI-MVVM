import 'package:e_commerce_app/product/init/localization_init.dart';
import 'package:e_commerce_app/product/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductInit {
  final LocalizationInit localizationInit = LocalizationInit();
  final AppRouter appRouter = AppRouter();
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}
