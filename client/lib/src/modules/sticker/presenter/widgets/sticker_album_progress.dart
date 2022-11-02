import 'package:flutter/material.dart';

class StickerAlbumProgress extends StatelessWidget {

  final int unicas;
  final int obitidas;
  final int repetidas;
  final double porcentagemCompleta;

  static const stickersTotal = 678;

  const StickerAlbumProgress({
    Key? key,
    required this.unicas,
    required this.obitidas,
    required this.repetidas,
  }) :  porcentagemCompleta = obitidas/stickersTotal,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LinearProgressIndicator(
            value: porcentagemCompleta,
            backgroundColor: const Color(0xffD9D9D9),
            minHeight: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Meu album"),
              Text("${(porcentagemCompleta*100).toStringAsFixed(1)}%")
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$obitidas de $stickersTotal"),
                Text("$repetidas repetidas | $unicas unicas")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
