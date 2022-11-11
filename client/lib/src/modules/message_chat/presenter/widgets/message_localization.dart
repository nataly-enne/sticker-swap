import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/message.dart';

class MessageLocalization extends StatelessWidget {
  final Message message;
  const MessageLocalization({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Messagem Localization");
  }
}