import 'package:flutter/material.dart';

import '../constant.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.buttonColor,
    this.textColor,
  });
  final String text;
  final Function() onTap;
  final Color? buttonColor ;
  final Color? textColor ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
            ),
          ))),
    );
  }
}
