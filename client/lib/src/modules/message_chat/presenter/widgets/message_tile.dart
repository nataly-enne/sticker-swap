import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message.dart';

class MessageTile extends StatelessWidget {
  final bool isMy;
  final Message message;
  const MessageTile({Key? key, required this.message, required this.isMy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isMy) {
      return Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: const EdgeInsets.fromLTRB(100.0, 10.0, 10.0, 4.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: const  BorderRadius.all(Radius.circular(15))
          ),

          child: Text(
            message.message,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              wordSpacing: 1
            ),  
          ),
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

          child: Text(
            message.message,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              wordSpacing: 1
            ),
          ),
        ),
      );
    }
  }

}
