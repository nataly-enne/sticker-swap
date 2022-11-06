import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/album.dart';
import 'package:sticker_swap_client/src/core/album_manager.dart';
import 'package:sticker_swap_client/src/modules/filter/domain/entities/filter.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/utils/consts/filter_modes_utils.dart';

class FilterBloc{

  Filter filter = Modular.get<Filter>();
  AlbumManager albumManager = Modular.get<AlbumManager>();

  void filterStickers(){
    bool Function(Sticker) functionFilter = FilterModesUtils.filterFunction[filter.modeFilter] as bool Function(Sticker);

    Album album = applyFliter(albumManager.album, functionFilter);
    albumManager.setAlbumView(album);

    Modular.to.pop();
  }

  Album applyFliter(Album album, bool Function(Sticker) functionFilter){
    Album albumView = Album();

    if(filter.filterOn){
      albumView.colectionStickers = {};

      List<Sticker> sticksGroup = [];

      for(int i =0; i < 38; i++){
        sticksGroup.clear();

        if(album.colectionStickers.containsKey(i)){
          for(Sticker sticker in (album.colectionStickers[i] as List<Sticker>)) {
            if(functionFilter(sticker))
              sticksGroup.add(sticker);
          }
        }

        if(sticksGroup.isNotEmpty)
          albumView.colectionStickers[i] = List.from(sticksGroup);
      }

    }else{
      albumView = albumManager.album;
    }

    return albumView;
  }

  void dispose(){}

}