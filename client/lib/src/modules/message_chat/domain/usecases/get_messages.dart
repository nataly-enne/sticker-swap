import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_simple.dart';


abstract class IGetMessages{
  Future<List<Message>> call({required int idChat});
}

class GetMessagesImpl implements IGetMessages{

  @override
  Future<List<Message>> call({required int idChat}) async{
    if(idChat == 0)
      return [MessageSimple(id: 0, message: "Vc tem figurinhas pra trocar?", idSender: 0)];
    else
      return [MessageSimple(id: 2, message: "Tite não me levou para copa.", idSender: 1)];
  }

}