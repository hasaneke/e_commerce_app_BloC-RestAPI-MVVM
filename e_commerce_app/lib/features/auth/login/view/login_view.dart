import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/features/auth/login/bloc/login_bloc.dart';
import 'package:e_commerce_app/product/extensions/show_scaffold_message.dart';
import 'package:e_commerce_app/product/router/app_router.dart';
import 'package:e_commerce_app/product/service/auth_service.dart';
import 'package:e_commerce_app/product/widgets/project_elevated_button.dart';
import 'package:e_commerce_app/product/widgets/project_text_field.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginView extends StatefulHookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userController = useTextEditingController();
    final passwordController = useTextEditingController();
    return BlocProvider(
      create: (context) => LoginBloc(service: context.read<IAuthService>()),
      child: Scaffold(
        body: _LoginForm(
            formKey: formKey,
            userController: userController,
            passwordController: passwordController),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({
    Key? key,
    required this.formKey,
    required this.userController,
    required this.passwordController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController userController;
  final TextEditingController passwordController;

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginComplete) {
          context.showScaffoldMessage("Login Success");
          AutoRouter.of(context).push(const HomeRoute());
        } else if (state is LoginFailedState) {
          context.showScaffoldMessage("Login Failed");
        }
      },
      child: Form(
          key: widget.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('LOGIN'),
                ProjectTextFormField(
                    controller: widget.userController, hintText: "username"),
                ProjectTextFormField(
                  controller: widget.passwordController,
                  hintText: "password",
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const CircularProgressIndicator(
                        color: Colors.black,
                      );
                    } else {
                      return ProjectElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(SignInEvent(
                              email: widget.userController.text,
                              password: widget.passwordController.text));
                        },
                        name: 'auth.login'.tr(),
                      );
                    }
                  },
                )
              ],
            ),
          )),
    );
  }
}
