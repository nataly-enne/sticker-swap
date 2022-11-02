import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/core/album.dart';
import 'package:sticker_swap_client/src/core/album_manager.dart';
import 'package:sticker_swap_client/src/core/user.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker_group.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/usecases/get_album.dart';
import 'package:sticker_swap_client/src/modules/sticker/presenter/widgets/bottom_sheet_sticker.dart';

class StickerBloc{

  double porcentagemCompleta = 0.33;

  User user = Modular.get<User>();
  AlbumManager albumManager = Modular.get<AlbumManager>();

  IGetAlbum getAlbumUsecase = Modular.get<IGetAlbum>();

  int idModePageNow = 0;
  final BehaviorSubject<int> _idModePageStream = BehaviorSubject.seeded(0);

  Stream<int> get getIdModePage => _idModePageStream.stream;

  TextEditingController searchController = TextEditingController();


  ///<!Casos de uso>
  Future<void> getAlbum() async{
    if(albumManager.albumView == null){
      Album album = await getAlbumUsecase(idUser: user.id);
      albumManager.setBaseAlbum(album);
    }
  }


  ///<!Funções da interface>
  void setIdModePage(int newIdModePage){
    if(newIdModePage != idModePageNow){
      idModePageNow = newIdModePage;
      _idModePageStream.sink.add(idModePageNow);
    }
  }

  void searchSticker(){
    print("Texto Buscado: ${searchController.text}");
  }

  void selectGroup(StickerGroup group){
    _idModePageStream.sink.add(1);
  }

  void openFilter(){}


  ///<!Modificações em Stickers>
  void addSticker(Sticker sticker){
    sticker.quantity += 1;
    _idModePageStream.sink.add(idModePageNow);
    //Enviar adição para servidor e banco interno
  }

  void removeSticker(Sticker sticker){
    sticker.quantity -= 1;
    _idModePageStream.sink.add(idModePageNow);
    //Enviar adição para servidor e banco interno
  }

  void detailsSticker(Sticker sticker){
    showModalBottomSheet<dynamic>(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(12.0),
            topRight:  Radius.circular(12.0)
        )),
        backgroundColor: Colors.white,
        context: Modular.routerDelegate.navigatorKey.currentContext!,
        builder: (_) => BottomSheetSticker(
          sticker: sticker,
          removeSticker: removeSticker,
          openDetails: (Sticker sticker){print("Abir detalhes");},
        )
    );
  }


  void dispose(){
    searchController.dispose();
    _idModePageStream.close();
  }

}