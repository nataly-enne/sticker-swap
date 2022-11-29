import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/message_chat/infra/models/message_model.dart';

class ChatModel extends Chat {
  ChatModel({
      required super.id,
      required super.name,
      required super.image,
      required super.lastMessage
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      lastMessage: MessageModel.fromMap(map['lastMessage']),
    );
  }

  static List<ChatModel> listFromJson(List<dynamic> json) {
    return (json)
        .map((e) => ChatModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
