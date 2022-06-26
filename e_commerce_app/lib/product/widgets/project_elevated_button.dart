import 'package:e_commerce_app/product/constants/project_colors.dart';
import 'package:e_commerce_app/product/constants/project_paddings.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProjectElevatedButton extends StatelessWidget {
  String? name;
  final Function()? onPressed;
  ProjectElevatedButton({
    this.name,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: ProjectPaddings.primaryPadding,
        width: context.width,
        height: context.height * 0.08,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: ProjectColors.livingCoral),
            onPressed: onPressed,
            child: Text(name ?? '')));
  }
}
