import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class BottomSheetSticker extends StatelessWidget {

  final Sticker sticker;
  final Function(Sticker) openDetails;
  final Function(Sticker) removeSticker;

  const BottomSheetSticker({
    Key? key,
    required this.sticker,
    required this.openDetails,
    required this.removeSticker
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppBar(
            title: Text(sticker.text, style: const TextStyle(color: Colors.black)),
            leading: IconButton(
                onPressed: ()=> Navigator.of(context).pop(),
                icon: const Icon(Icons.close, color: Colors.black,)
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0.0,
          ),

          Row(
            children: [
              TextButton(
                  onPressed: (){removeSticker(sticker);},
                  child: Text("Remover")
              )
            ],
          ),

        ],
      ),
    );
  }
}
