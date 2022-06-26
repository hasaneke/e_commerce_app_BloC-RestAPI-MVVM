import 'package:e_commerce_app/product/init/product_init.dart';
import 'package:e_commerce_app/product/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  ProductInit productInit = ProductInit();
  await productInit.init();
  final localizationUnit = productInit.localizationInit;
  final routerUnit = productInit.appRouter;
  runApp(EasyLocalization(
      supportedLocales: localizationUnit.supportedLocales,
      path: localizationUnit.localizationPath,
      child: MyApp(
        appRouter: routerUnit,
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.appRouter, Key? key}) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
