import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';

class ChatTile extends StatelessWidget {

  final Chat chat;
  const ChatTile({
    required this.chat,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(chat.image),
      title: Text(chat.name),
      subtitle: Text(chat.lastMessage.message),
      onTap: (){},
    );
  }
}
