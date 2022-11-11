import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/message_chat/presenter/message_chat_bloc.dart';
import 'package:sticker_swap_client/src/modules/message_chat/presenter/widgets/bottom_message_chat.dart';
import 'package:sticker_swap_client/src/modules/message_chat/presenter/widgets/message_tile.dart';

class MessageChatScreen extends StatefulWidget {
  const MessageChatScreen({Key? key}) : super(key: key);

  @override
  State<MessageChatScreen> createState() => _MessageChatScreenState();
}

class _MessageChatScreenState extends ModularState<MessageChatScreen, MessageChatBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mensagem"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: ListView(
                children: [
                  MessageTile()

                ],
              )
          ),
          BottomMessageChat()
        ],
      ),
    );
  }
}
