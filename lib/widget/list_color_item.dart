import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/select_color/select_color_cubit.dart';

import '../constant.dart';
import 'color_item.dart';

class ListColorItem extends StatelessWidget {
  const ListColorItem({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: BlocBuilder<SelectColorCubit, SelectColorState>(
        builder: (context, state) {
          int selectColorItemIndex = BlocProvider.of<SelectColorCubit>(context).colorItemIndex ;
          return ListView.builder(
            itemCount: kColorsList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
              GestureDetector(
                onTap: () => BlocProvider.of<SelectColorCubit>(context).selectColorItem(index),
                child: ColorItem(color: kColorsList[index] , isActive : index == selectColorItemIndex  )),
          );
        },
      ),
    );
  }
}
