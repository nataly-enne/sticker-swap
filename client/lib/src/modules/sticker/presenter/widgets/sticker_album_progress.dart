import 'package:flutter/material.dart';

class StickerAlbumProgress extends StatelessWidget {

  final double porcentagemCompleta;
  const StickerAlbumProgress({Key? key, required this.porcentagemCompleta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Aqui tem que ajeitar a porcetagem do album"),
          LinearProgressIndicator(
            value: porcentagemCompleta,
          ),
          Text("Aqui tem que ajeitar a porcetagem do album")
        ],
      ),
    );
  }
}
