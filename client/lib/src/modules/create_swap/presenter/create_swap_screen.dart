import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/core/components/app_bar_bottom_sheet.dart';

class CreateSwapScreen extends StatefulWidget {
  @override
  _CreateSwapScreenState createState() => _CreateSwapScreenState();
}

class _CreateSwapScreenState extends State<CreateSwapScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBarBottomSheet("Sugerir troca", context),

        Text("Aviso"),
        Text("Colocar lista"),
        Text("Colocar botão"),
      ],
    );
  }
}
