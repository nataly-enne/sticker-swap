import 'package:sticker_swap_client/src/modules/chat/domain/entities/message.dart';


abstract class IGetMessages{
  Future<List<Message>> call({required int idChat});
}

class GetMessagesImpl implements IGetMessages{

  @override
  Future<List<Message>> call({required int idChat}) async{
    if(idChat == 0)
      return [Message(id: 0, message: "Vc tem figurinhas pra trocar?")];
    else
      return [Message(id: 2, message: "Tite não me levou para copa.")];
  }

}