import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final GlobalKey<FormState> formkey = GlobalKey();
  String? title , subtitle ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.always,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(20),
              CustomTextFormField(
                hintText: 'Title',
                onSaved: (value){
                  title = value ;
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'field is required';
                  } else {
                    return null;
                  }
                },
              ),
              const Gap(15),
              CustomTextFormField(
                hintText: 'Content',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                onSaved: (value) {
                  subtitle = value ;
                },    
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'field is required';
                  } else {
                    return null;
                  }
                },
              ),
              const Gap(50),
              CustomButton(
                text: 'Add',
                onTap: () {

                  if ( formkey.currentState!.validate()){
                    formkey.currentState!.save() ;
                    print ( "$title , $subtitle") ;
                  }
                },
                textColor: Colors.black,
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
