import 'package:flutter/cupertino.dart';

class StickerBloc{

  double porcentagemCompleta = 0.33;
  TextEditingController searchController = TextEditingController();


  void searchSticker(){
    print("Texto Buscado: ${searchController.text}");
  }

  void dispose(){
    searchController.dispose();
  }

}