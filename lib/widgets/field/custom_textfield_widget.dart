import 'package:flutter/material.dart';
import 'package:recipeapp/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final String? Function(String?)? validate;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final Icon? suffix;
  final bool? readOnly;
  CustomTextField(
      {required this.textEditingController,
      this.validate,
      this.keyboardType,
      required this.hint,
      this.isPassword = false,
      this.suffix,
      this.readOnly,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: textEditingController,
      obscureText: isPassword,
      validator: validate,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        filled: true,
        suffix: suffix,
        fillColor: AppColors.greyColor.withOpacity(.3),
        contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      ),
    );
  }
}
