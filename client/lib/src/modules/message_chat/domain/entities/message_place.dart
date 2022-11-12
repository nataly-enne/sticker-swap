import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';

class MessagePlace extends Message{

  MessagePlace({
    required super.id,
    required super.idSender,

    super.type = 2,
    super.message = "Local de troca",
  });


}