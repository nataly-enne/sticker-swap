import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class ElementSticker extends StatelessWidget {
  final Sticker sticker;
  const ElementSticker({Key? key, required this.sticker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 45,
      color: Colors.red,
      child: Center(child: Text(sticker.text),),
    );
  }
}
