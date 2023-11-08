import 'package:flutter/material.dart';

import 'custom_search_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          'Notes',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        Spacer(),
        CustomSearchIcon()
      ],
    );
  }
}
