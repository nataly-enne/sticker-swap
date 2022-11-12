import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';

class MessageTile extends StatelessWidget {
  final Message message;
  const MessageTile({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(message.message);
  }
}
