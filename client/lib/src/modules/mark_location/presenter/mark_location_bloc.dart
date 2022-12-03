import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_place.dart';
import 'package:sticker_swap_client/src/utils/const/status_message_confirm.dart';

class MarkLocationBloc{

  final Function(MessagePlace) markLocation;
  MarkLocationBloc({required this.markLocation});

  TextEditingController placeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  void sendMessage(){
    MessagePlace message = MessagePlace(
        time: timeController.text,
        place: placeController.text,
        date: dateController.text,
        status: StatusMessageConfirm.wait,
        id: 1,
        idSender: Modular.get<User>().id!
    );
    markLocation(message);
    Modular.to.pop();
  }

  void dispose(){
    dateController.dispose();
    placeController.dispose();
    timeController.dispose();
  }

}