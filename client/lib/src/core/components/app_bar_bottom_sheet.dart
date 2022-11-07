import 'package:flutter/material.dart';

class AppBarBottomSheet extends AppBar{
  AppBarBottomSheet(String text, BuildContext context) : super(
    title: Text(text, style: const TextStyle(color: Colors.black)),
    leading: IconButton(
        onPressed: ()=> Navigator.of(context).pop(),
        icon: const Icon(Icons.close, color: Colors.black,)
    ),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0.0,
  );
}