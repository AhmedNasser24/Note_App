import 'package:flutter/material.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});
  static String id = 'home view id' ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container( 
        child: Column(
          children: const [
             ListTile(
                            
              trailing: Icon(Icons.delete , color: Colors.black,),
            ),
          ],
        ),
      ),
    );
  }
}