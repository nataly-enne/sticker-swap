
import 'package:flutter/material.dart';

class BottomMessageChat extends StatelessWidget {
  const BottomMessageChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.green,
      child: Text("Area de escrever mensagem"),
    );
  }
}
