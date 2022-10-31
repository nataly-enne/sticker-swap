import 'package:flutter/material.dart';

class HeaderSticker extends StatelessWidget {
  final Function() openFilter;

  const HeaderSticker({
    Key? key,
    required this.openFilter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Theme.of(context).primaryColor,
      child: const Text("Criar o cabeçalho do page sticker"),
    );
  }
}
