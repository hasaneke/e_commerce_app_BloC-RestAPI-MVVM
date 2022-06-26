import 'package:e_commerce_app/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    context.read<HomeBloc>().add(InitializeHome());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.isInitialized) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    'Laptops',
                    style: context.textTheme.headline2,
                  ),
                  ...state.categories!
                      .map((e) => ListTile(
                            leading: CircleAvatar(
                                backgroundImage:
                                    Image.network(e.thumbnail).image),
                            title: Text(e.title),
                          ))
                      .toList(),
                ]),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
        },
      ),
    );
  }
}
