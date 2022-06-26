import 'package:e_commerce_app/features/home/bloc/home_bloc.dart';
import 'package:e_commerce_app/features/home/view/home_body.dart';
import 'package:e_commerce_app/product/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(context.read<IProductService>()),
      child: const HomeBody(),
    );
  }
}
