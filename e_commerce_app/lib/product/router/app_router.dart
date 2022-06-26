import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/features/auth/login/view/login_view.dart';
import 'package:e_commerce_app/features/home/view/home_page.dart';
import 'package:e_commerce_app/features/splash/splash_view.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, path: '/splash', initial: true),
    AutoRoute(page: LoginView, path: '/login'),
    AutoRoute(page: HomeView, path: '/home')
  ],
)
class AppRouter extends _$AppRouter {}
