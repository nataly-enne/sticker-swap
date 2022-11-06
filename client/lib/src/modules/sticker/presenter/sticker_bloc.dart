import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/core/album.dart';
import 'package:sticker_swap_client/src/core/album_manager.dart';
import 'package:sticker_swap_client/src/core/user.dart';
import 'package:sticker_swap_client/src/modules/filter/domain/entities/filter.dart';
import 'package:sticker_swap_client/src/modules/filter/presenter/filter_module.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker_group.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/usecases/get_album.dart';
import 'package:sticker_swap_client/src/modules/sticker/presenter/widgets/bottom_sheet_sticker.dart';
import 'package:sticker_swap_client/src/utils/consts/limits_group_utils.dart';

class StickerBloc{

  User user = Modular.get<User>();
  AlbumManager albumManager = Modular.get<AlbumManager>();

  IGetAlbum getAlbumUsecase = Modular.get<IGetAlbum>();

  int firstGroup= LimitsGroupUtils.firstGroup;
  int lastGroup= LimitsGroupUtils.lastGroup;

  int idModePageNow = 0;
  final BehaviorSubject<int> _idModePageStream = BehaviorSubject.seeded(0);
  final BehaviorSubject<bool> _statusStream = BehaviorSubject();

  Stream<int> get getIdModePage => _idModePageStream.stream;
  Stream<bool> get getStatus => _statusStream.stream;


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
      firstGroup= LimitsGroupUtils.firstGroup;
      lastGroup= LimitsGroupUtils.lastGroup;

      idModePageNow = newIdModePage;
      _idModePageStream.sink.add(idModePageNow);
    }
  }

  void searchSticker(){
    print("Texto Buscado: ${searchController.text}");
  }

  void selectGroup(StickerGroup group){
    if(group.id >= 0){
      firstGroup = group.id;
      lastGroup = group.id;
    }else{
      firstGroup= LimitsGroupUtils.firstGroup;
      lastGroup= LimitsGroupUtils.lastGroup;
    }

    _idModePageStream.sink.add(1);
  }

  void openFilter() async{
    await showModalBottomSheet<dynamic>(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(12.0),
            topRight:  Radius.circular(12.0)
        )),
        backgroundColor: Colors.white,
        context: Modular.routerDelegate.navigatorKey.currentContext!,
        builder: (_) => FilterModule()
    );

    _idModePageStream.sink.add(1);
  }


  ///<!Modificações em Stickers>
  void addSticker(Sticker sticker){
    sticker.quantity += 1;

    if(sticker.quantity == 1)
      albumManager.obtidas++;
    else
      albumManager.repetidas++;


    _idModePageStream.sink.add(1);
    _statusStream.sink.add(true);
    //Enviar adição para servidor e banco interno
  }

  void removeSticker(Sticker sticker){
    sticker.quantity -= 1;

    if(sticker.quantity == 0)
      albumManager.obtidas--;
    else
      albumManager.repetidas--;

    _idModePageStream.sink.add(1);
    _statusStream.sink.add(true);
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
    _statusStream.close();
  }

}