import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/infra/models/message_place_model.dart';
import 'package:sticker_swap_client/src/modules/message_chat/infra/models/message_simple_model.dart';

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
        .map((e){
          if(e['type'] == 0)
            return MessageSimpleModel.fromMap(e as Map<String, dynamic>) as MessageModel;
          if(e['type'] == 2)
            return MessagePlaceModel.fromMap(e as Map<String, dynamic>) as MessageModel;

          return MessageModel.fromMap(e as Map<String, dynamic>);
        }).toList();
  }
}
