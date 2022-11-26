import 'package:flutter/material.dart';

class MarkLocationBloc{

  TextEditingController localController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController horarioController = TextEditingController();


  void dispose(){
    dataController.dispose();
    localController.dispose();
    horarioController.dispose();
  }

}