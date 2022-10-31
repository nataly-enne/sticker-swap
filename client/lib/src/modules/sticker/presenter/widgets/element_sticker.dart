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
    return SizedBox(
      height: 65,
      width: 100,

      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Ink(
              width: 90,
              height: 45,
              decoration: BoxDecoration(
                  color: sticker.quantity == 0 ? Colors.white : const Color(0xff9A1031),
                  border: Border.all(
                    color: const Color(0xff131213),
                    width: sticker.quantity == 0 ? 2.5 : 0,
                  ),
                borderRadius: const BorderRadius.all(Radius.circular(25))
              ),
              child: InkWell(
                onTap: ()=> addSticker(sticker),
                onLongPress: ()=> removeSticker(sticker),
                borderRadius: const BorderRadius.all(Radius.circular(25)),

                child: Center(
                  child: Text(
                    sticker.text,
                    style: TextStyle(
                      color: sticker.quantity == 0 ? const Color(0xff131213) : Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ),

          if(sticker.quantity > 1)
            Container(
              width: 28,
              height: 18,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color(0xffE5ED84),
                  borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              margin: const EdgeInsets.only(right: 5),
              child: Text(
                "+${sticker.quantity}",
                style: const TextStyle(fontSize: 10),
              ),
            ),
        ],
      ),
    );
  }
}
