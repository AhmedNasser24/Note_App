import 'package:flutter/material.dart';

import '../constant.dart';




class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.onChanged ,
    required this.hintText,
    this.validator,
    this.keyboardType,
    this.contentPadding,
  });
  Function(String)? onChanged ;
  final String hintText;
  TextInputType? keyboardType ;
  String? Function(String?)? validator ;
  EdgeInsetsGeometry? contentPadding ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ,
      keyboardType: TextInputType.datetime,
      onChanged: onChanged ,
      
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: contentPadding,
        hintStyle: const TextStyle(color: kPrimaryColor , fontSize: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder:OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ) ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
