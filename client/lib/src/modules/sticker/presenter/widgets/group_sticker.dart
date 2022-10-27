import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker_group.dart';

class GroupSticker extends StatelessWidget {
  final StickerGroup group;
  const GroupSticker({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 80,
      color: Colors.green,
      child: Center(child: Text("Colocar bandeira do pais"),),
    );
  }
}
