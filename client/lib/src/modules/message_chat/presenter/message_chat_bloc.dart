import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/usecases/get_messages.dart';

class MessageChatBloc{
  final User _user = Modular.get<User>();
  final IGetMessages _getMessagesUseCase = Modular.get<IGetMessages>();

  TextEditingController textController = TextEditingController();

  final BehaviorSubject<List<Message>> _messagesStream = BehaviorSubject();
  Stream<List<Message>> get getMessagesView => _messagesStream.stream;


  void getMessages(Chat chat) async{
    List<Message> Messages = await _getMessagesUseCase.call(idChat: chat.id);
    _messagesStream.sink.add(Messages);
  }

  bool isMyMessage(Message message)=> message.idSender == _user.id;


  void dispose(){
    textController.dispose();
    _messagesStream.close();
  }
  
}