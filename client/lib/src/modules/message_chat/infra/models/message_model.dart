import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';

class MessageModel extends Message {
  MessageModel(
      {required super.id,
      required super.type,
      required super.message,
      required super.idSender});

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'],
      type: map['type'], 
      message: map['message'],
      idSender: map['idSender'],
    );
  }

  static List<MessageModel> listFromJson(List<dynamic> json) {
    return (json)
        .map((e) => MessageModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
