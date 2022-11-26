import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_place.dart';
import 'package:sticker_swap_client/src/utils/consts/status_message_confirm.dart';

class MarkLocationBloc{

  final Function(MessagePlace) markLocation;
  MarkLocationBloc({required this.markLocation});

  TextEditingController localController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController horarioController = TextEditingController();

  void sendMessage(){
    MessagePlace message = MessagePlace(
        time: "",
        place: localController.text,
        status: StatusMessageConfirm.wait,
        id: 1,
        idSender: Modular.get<User>().id!
    );
    markLocation(message);
    Modular.to.pop();
  }

  void dispose(){
    dataController.dispose();
    localController.dispose();
    horarioController.dispose();
  }

}