import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key, required this.icon, this.onPressed,
  });
  final IconData icon ;
  final void Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon , size: 30,)),
    );
  }
}