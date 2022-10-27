import 'package:flutter/material.dart';

class HeaderSticker extends StatelessWidget {
  const HeaderSticker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Theme.of(context).primaryColor,
      child: Text("Criar o cabeçalho do page sticker"),
    );
  }
}
