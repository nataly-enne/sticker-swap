import 'package:flutter/material.dart';

class GroupSticker extends StatelessWidget {
  const GroupSticker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      color: Colors.red,
      child: Center(child: Text("BRA"),),
    );
  }
}
