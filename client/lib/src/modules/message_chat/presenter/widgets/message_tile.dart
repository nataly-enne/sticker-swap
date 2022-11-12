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
          margin: const EdgeInsets.fromLTRB(14.0, 4.0, 2.0, 4.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),

          child: Text(message.message,),
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
              borderRadius: const BorderRadius.all(Radius.circular(10))
          ),

          child: Text(
            message.message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

}
