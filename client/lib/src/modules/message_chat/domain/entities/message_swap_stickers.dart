import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';

class MessageSwapStickers extends Message{

  MessageSwapStickers({
    required super.id,

    super.type = 1,
    super.message = "Sujestão de troca",
  });


}