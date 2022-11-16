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


  final TextStyle textStyleBold = const TextStyle(
      fontSize: 16,
      wordSpacing: 2,
      letterSpacing: -0.24,
      color: Color(0xff131213),
      fontWeight: FontWeight.bold
  );
  final TextStyle textStyleNormal = const TextStyle(
    fontSize: 13,
    color: Color(0xff131213),
    fontWeight: FontWeight.w500,
    letterSpacing: -0.24,
  );


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 30, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: MediaQuery.of(context).size. width * porcentagemCompleta,
                height: 10,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Meu álbum", style: textStyleNormal,),
                Text(
                  "${(porcentagemCompleta*100).toStringAsFixed(0)}%",
                  style: textStyleNormal,
                )
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$obitidas de $stickersTotal", style: textStyleBold),
              Text("$repetidas repetidas | $unicas únicas",style: textStyleBold)
            ],
          ),
        ],
      ),
    );
  }
}
