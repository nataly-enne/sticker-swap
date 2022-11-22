import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_place.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_simple.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_swap_stickers.dart';
import 'package:sticker_swap_client/src/utils/consts/status_message_confirm.dart';


abstract class IGetMessages{
  Future<List<Message>> call({required int idChat});
}

class GetMessagesImpl implements IGetMessages{

  @override
  Future<List<Message>> call({required int idChat}) async{
    if(idChat == 0)
      return [
        MessageSwapStickers(id: 3, idSender: 1,status: StatusMessageConfirm.wait ),
        MessagePlace(id: 5, idSender: 1, time: "14:30", place: "Leitura, Natal shopping", status: StatusMessageConfirm.wait),
        MessageSimple(id: 0, message: "Vc tem figurinhas pra trocar?", idSender: 0)
      ];
    else
      return [
        MessageSimple(id: 2, message: "Tite não me levou para copa.", idSender: 1),
      ];
  }

}