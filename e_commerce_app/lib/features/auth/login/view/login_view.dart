import 'package:e_commerce_app/product/widgets/project_elevated_button.dart';
import 'package:e_commerce_app/product/widgets/project_text_field.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('LOGIN'),
                const ProjectTextFormField(hintText: "username"),
                const ProjectTextFormField(
                  hintText: "password",
                ),
                ProjectElevatedButton(
                  onPressed: () {},
                  name: 'auth.login'.tr(),
                )
              ],
            ),
          )),
    );
  }
}
