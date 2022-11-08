import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/message.dart';


abstract class IGetChats{

  Future<List<Chat>> call({required int idUser});

}

class GetChatsImpl implements IGetChats{

  @override
  Future<List<Chat>> call({required int idUser}) async{
    return [
      Chat(
          id: 0,
          name: "Vinimalvadeza Jr.",
          image: "https://i.pinimg.com/736x/71/57/6d/71576dfdc502b33c906783dc35e43de3.jpg",
          lastMessage: Message(id: 0, message: "Vc tem figurinhas pra trocar?")
      )
    ];
  }

}