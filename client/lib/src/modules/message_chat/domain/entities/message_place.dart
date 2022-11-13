import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';

class MessagePlace extends Message{

  String time;
  String place;

  int status;

  MessagePlace({
    required this.time,
    required this.place,
    required this.status,

    required super.id,
    required super.idSender,

    super.type = 2,
    super.message = "Local de troca",
  });


}