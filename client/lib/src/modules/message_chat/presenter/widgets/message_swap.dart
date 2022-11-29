import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_swap_stickers.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/utils/consts/status_message_confirm.dart';

class MessageSwap extends StatelessWidget {
  final bool isMy;
  final MessageSwapStickers message;
  final Function({required MessageSwapStickers message, required int newStatus}) avaliableSwap;

  const MessageSwap({
    Key? key,
    required this.isMy,
    required this.message,
    required this.avaliableSwap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isMy) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 4.0, 2.0, 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),

              child: _textSwap(),
            ),

            _buttomStatus()
          ],
        ),
      );
    }else{
      return Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 2.0, 14.0, 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15))
              ),

              child: _textSwap(textStyle: TextStyle(color: Colors.white)),
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
              _buttomStatus()
          ],
        ),
      );
    }
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

  Widget _buttomStatus(){
    if(message.status == StatusMessageConfirm.accepted)
      return _buttonAccepted();
    if(message.status == StatusMessageConfirm.rejected)
      return _buttonReject();

    return SizedBox(height: 2, width: 0,);
  }

  Widget _buttonAccepted(){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){
          avaliableSwap(
              message: message,
              newStatus: StatusMessageConfirm.accepted
          );
        },
        borderRadius: BorderRadius.all(Radius.circular(100)),
        child: Ink(
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),

          child: Icon(Icons.check, color: Colors.white, size: 18,),
        ),
      ),
    );
  }

  Widget _buttonReject(){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){
          avaliableSwap(
              message: message,
              newStatus: StatusMessageConfirm.rejected
          );
        },
        borderRadius: BorderRadius.all(Radius.circular(100)),
        child: Ink(
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: Color(0xff9A1032),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),

          child: Icon(Icons.close, color: Colors.white, size: 18,),
        ),
      ),
    );
  }
}
