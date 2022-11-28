import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/usecases/get_chats.dart';

class MessageSwap extends StatelessWidget {

  final Chat chat;
  const MessageSwap({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    

    return Container(
      decoration: BoxDecoration(
         border:  Border(
          bottom: BorderSide(color: Color.fromRGBO(117, 122, 163, 0.79)))
        ),

        margin: EdgeInsets.only(top: 25,bottom: 25),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: (() => Modular.to.pop()),
          ),
          const SizedBox(
            width: 25,
          ),
          Column(
            children:  [
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 4),
                child: Text(chat.name, style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("id: ${chat.id}",
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(117, 122, 163, 1))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
