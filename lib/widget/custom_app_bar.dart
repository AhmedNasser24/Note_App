import 'package:flutter/material.dart';

import 'custom_search_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});
  final String title ;
  final IconData icon ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
            title, 
          style: const TextStyle(fontSize: 35, color: Colors.white),
        ),
        const Spacer(),
        CustomSearchIcon(icon: icon,) 
      ],
    );
  }
}
