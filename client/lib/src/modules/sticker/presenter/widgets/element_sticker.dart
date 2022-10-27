import 'package:flutter/material.dart';

class ElementSticker extends StatelessWidget {
  const ElementSticker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 45,
      color: Colors.red,
      child: Center(child: Text("BRA11"),),
    );
  }
}
