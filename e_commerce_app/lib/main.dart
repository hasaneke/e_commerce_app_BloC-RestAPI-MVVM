import 'package:e_commerce_app/product/init/product_init.dart';
import 'package:e_commerce_app/product/router/app_router.dart';
import 'package:e_commerce_app/product/service/auth_service.dart';
import 'package:e_commerce_app/product/service/product_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  ProductInit productInit = ProductInit();
  await productInit.init();

  runApp(EasyLocalization(
      supportedLocales: productInit.localizationInit.supportedLocales,
      path: productInit.localizationInit.localizationPath,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IAuthService>(create: (context) => AuthService()),
        RepositoryProvider<IProductService>(
            create: (context) => ProductService())
      ],
      child: MaterialApp.router(
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
      ),
    );
  }
}
