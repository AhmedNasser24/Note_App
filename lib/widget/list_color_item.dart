import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/select_color/select_color_cubit.dart';

import 'color_item.dart';

class ListColorItem extends StatelessWidget {
  const ListColorItem({
    super.key,
  });
  final List < Color > colors = const [
    Colors.indigo,
    Colors.green,
    Colors.amber,
    Colors.deepPurple,
    Colors.red,
    Colors.teal,
  ] ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectColorCubit(),
      child: SizedBox(
        height: 150,
        child: BlocBuilder<SelectColorCubit, SelectColorState>(
          builder: (context, state) {
            int selectColorItemIndex = BlocProvider.of<SelectColorCubit>(context).colorItemIndex ;
            return ListView.builder(
              itemCount: colors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                GestureDetector(
                  onTap: () => BlocProvider.of<SelectColorCubit>(context).selectColorItem(index),
                  child: ColorItem(color: colors[index] , isActive : index == selectColorItemIndex  )),
            );
          },
        ),
      ),
    );
  }
}
