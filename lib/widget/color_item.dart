import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.color,
    required this.isActive,
  });
  final Color color;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: isActive
          ? CircleAvatar(
              backgroundColor: Colors.white,
              radius: 38,
              child: CircleAvatar(
                radius: 35,
                backgroundColor: color,
              ),
            )
          : CircleAvatar(
              radius: 27,
              backgroundColor: color,
            ),
    );
  }
}
