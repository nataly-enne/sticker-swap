import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class ElementSticker extends StatelessWidget {
  final Sticker sticker;
  final Function(Sticker) addSticker;
  final Function(Sticker) removeSticker;

  const ElementSticker({
    Key? key,
    required this.sticker,
    required this.addSticker,
    required this.removeSticker
  }) : super(key: key);

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
