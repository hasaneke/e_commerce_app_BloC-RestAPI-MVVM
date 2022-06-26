import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/product/router/app_router.dart';
import 'package:e_commerce_app/product/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      AutoRouter.of(context).replace(const HomeRoute());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthService(),
      child: const Scaffold(
        body: Center(
          child: Text('E COMMERCE'),
        ),
      ),
    );
  }
}
