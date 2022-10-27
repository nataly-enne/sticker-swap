import 'package:flutter/material.dart';

class GroupSticker extends StatelessWidget {
  const GroupSticker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 80,
      color: Colors.green,
      child: Center(child: Text("Colocar bandeira do brasil"),),
    );
  }
}
