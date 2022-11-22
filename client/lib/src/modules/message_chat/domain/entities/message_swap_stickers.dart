import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';

class MessageSwapStickers extends Message{

  int status;

  MessageSwapStickers({
    required super.id,
    required super.idSender,
    required this.status,

  super.type = 1,
    super.message = "Sujestão de troca",
  });


}