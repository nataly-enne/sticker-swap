import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_place.dart';

class MessageLocalization extends StatelessWidget {
  final bool isMy;
  final MessagePlace message;
  const MessageLocalization({Key? key, required this.message, required this.isMy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isMy) {
      return Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: const EdgeInsets.fromLTRB(14.0, 4.0, 2.0, 4.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),

          child: _textPlace(),
        ),
      );
    }else{
      return Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: const EdgeInsets.fromLTRB(2.0, 2.0, 14.0, 2.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(15))
          ),

          child: _textPlace(textStyle: TextStyle(color: Colors.white)),
        ),
      );
    }
  }


  Widget _textPlace({TextStyle? textStyle}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Sugestão de local", style:  textStyle,),
        Divider(height: 8, color: textStyle?.color,),
        Text("Local:", style: textStyle,),
        Text("Horário:", style: textStyle,),
      ],
    );
  }

}