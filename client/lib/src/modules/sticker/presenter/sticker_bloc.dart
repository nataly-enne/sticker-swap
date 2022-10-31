import 'package:flutter/cupertino.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker_group.dart';

class StickerBloc{

  double porcentagemCompleta = 0.33;
  TextEditingController searchController = TextEditingController();


  void searchSticker(){
    print("Texto Buscado: ${searchController.text}");
  }

  void selectGroup(StickerGroup group){}

  void openFilter(){}


  void addSticker(Sticker sticker){
    print("Adicionou");
  }
  void detailsSticker(Sticker sticker){
    print("Mostrar detalhes");
  }


  void dispose(){
    searchController.dispose();
  }

}