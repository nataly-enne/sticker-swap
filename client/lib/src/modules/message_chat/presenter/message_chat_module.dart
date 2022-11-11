import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/message_chat/presenter/message_chat_bloc.dart';
import 'package:sticker_swap_client/src/modules/message_chat/presenter/message_chat_screen.dart';

class MessageChatModule extends Module{
  @override
  List<Bind> get binds => [
    Bind<MessageChatBloc>((i)=> MessageChatBloc()),
  ];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context, args) => const MessageChatScreen()),
  ];
}