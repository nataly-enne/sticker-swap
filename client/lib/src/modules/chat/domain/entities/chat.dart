import 'package:sticker_swap_client/src/modules/chat/domain/entities/message.dart';

class Chat{
  String id;
  String name;
  String image;
  Message lastMessage;

  Chat({
    required this.id,
    required this.name,
    required this.image,
    required this.lastMessage
  });
}