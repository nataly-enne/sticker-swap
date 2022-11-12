import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';


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
          lastMessage: Message(id: 0, message: "Vc tem figurinhas pra trocar?", idSender: 0, type: 0)
      ),
      Chat(
          id: 1,
          name: "El tanque",
          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVmSZbr3E4I5pQVoMny7KCi32RoQ2njQVxsA&usqp=CAU",
          lastMessage: Message(id: 2, message: "Tite não me levou para copa.", idSender: 0, type: 0)
      )
    ];
  }

}