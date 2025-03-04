import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool? isloading;

  const CustomButton(
      {this.isloading = false,
      required this.text,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
      ),
      child: isloading == true
          ? CupertinoActivityIndicator()
          : Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
    );
  }
}
