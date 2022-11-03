import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker_group.dart';

class GroupSticker extends StatelessWidget {
  final StickerGroup group;
  final Function(StickerGroup) onTap;

  const GroupSticker({
    Key? key,
    required this.group,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      height: 135,
      child: Column(
        children: [
          InkWell(
            onTap: ()=> onTap(group),
            borderRadius: BorderRadius.circular(20),

            child: Ink(
              width: 95,
              height: 75,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
                image: group.isImageIcon
                    ? null
                    : DecorationImage(
                        image: NetworkImage(group.image,),
                        fit: BoxFit.cover
                      )
              ),
              child: group.isImageIcon
                  ? Padding(padding: const EdgeInsets.all(20.0), child: Image.asset(group.image),)
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:6.0),
            child: Text(
              group.name,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
