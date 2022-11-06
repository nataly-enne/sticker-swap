import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/album.dart';
import 'package:sticker_swap_client/src/core/album_manager.dart';
import 'package:sticker_swap_client/src/modules/filter/domain/entities/filter.dart';

class FilterBloc{

  Filter filter = Modular.get<Filter>();
  AlbumManager albumManager = Modular.get<AlbumManager>();

  void filterStickers(){
    Album album = filter.applyFliter(albumManager.album);
    albumManager.setAlbumView(album);

    Modular.to.pop();
  }

  void dispose(){}

}