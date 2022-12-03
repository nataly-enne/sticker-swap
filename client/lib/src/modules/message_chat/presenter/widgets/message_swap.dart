import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_swap_stickers.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/utils/const/status_message_confirm.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../chat/domain/entities/chat.dart';

class MessageSwap extends StatelessWidget {
  final bool isMy;
  final MessageSwapStickers message;
  final Chat chat;
  final Function({required MessageSwapStickers message, required int newStatus}) availableSwap;

  const MessageSwap({
    Key? key,
    required this.isMy,
    required this.message,
    required this.availableSwap,
    required this.chat
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
     if(isMy) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(100.0, 10.0, 10.0, 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(15))
              ),

              child: _textSwap(textStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black,  wordSpacing: 1)),
            ),
            _buttonStatus()
          ],
        ),
      );
    }else{
      return Column (
          children: [ 
            Container(child: _top()),
            Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 100.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                  ),

                  child: _textSwap(textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, wordSpacing: 1)),
                ),

                if(message.status == StatusMessageConfirm.wait)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buttonReject(),
                      _buttonAccepted(),
                    ],
                  )
                else
                  _buttonStatus()
              ],
            ),
          ),
        ]
      );
    }
  }

  Widget _top(){
    return Container(
      decoration: const BoxDecoration(
         border:  Border(
          bottom: BorderSide(color: Color.fromRGBO(117, 122, 163, 0.79)))
        ),

        margin: const EdgeInsets.only(top: 25,bottom: 25),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: (() => Modular.to.pop()),
          ),
          const SizedBox(
            width: 25,
          ),
          Column(
            children:  [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                child: Text(chat.name, style: const TextStyle(fontSize: 18)),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Visto por último 11 minutos atrás",
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(117, 122, 163, 1))),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textSwap({TextStyle? textStyle}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Sugestão de troca", style:  textStyle,),
        Divider(height: 8, color: textStyle?.color,),

        for(Sticker sticker in message.stickersNeed)
          Text(sticker.text, style: textStyle)
      ],
    );
  }

  Widget _buttonStatus(){
    if(message.status == StatusMessageConfirm.accepted) {
      return _buttonAccepted();
    }
    if(message.status == StatusMessageConfirm.rejected) {
      return _buttonReject();
    }

    return const SizedBox(height: 2, width: 0,);
  }

  Widget _buttonAccepted(){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: (){
          availableSwap(
              message: message,
              newStatus: StatusMessageConfirm.accepted
          );
        },
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Ink(
          padding: const EdgeInsets.all(6.0),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),

          child: const Icon(Icons.check, color: Colors.white, size: 18,),
        ),
      ),
    );
  }

  Widget _buttonReject(){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: (){
          availableSwap(
              message: message,
              newStatus: StatusMessageConfirm.rejected
          );
        },
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Ink(
          padding: const EdgeInsets.all(6.0),
          decoration: const BoxDecoration(
            color: Color(0xff9A1032),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),

          child: const Icon(Icons.close, color: Colors.white, size: 18,),
        ),
      ),
    );
  }
}
