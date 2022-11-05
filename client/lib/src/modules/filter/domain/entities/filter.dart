import 'package:sticker_swap_client/src/core/album.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/utils/consts/filter_modes_utils.dart';

class Filter{
  bool filterOn = false;
  Function(Sticker) modeFilter = FilterModesUtils.all;

  void setFilterAlbum(Function(Sticker) modeFilte, bool filterOn){
    this.modeFilter = modeFilte;
    this.filterOn = filterOn;
  }

  Album applyFliter(Album album){
    Album albumView = Album();
    albumView.colectionStickers = {};

    List<Sticker> sticksGroup = [];

    for(int i =0; i < 38; i++){
      sticksGroup.clear();

      if(album.colectionStickers.containsKey(i))
        for(Sticker sticker in (album.colectionStickers[i] as List<Sticker>))
          if(modeFilter(sticker))
            sticksGroup.add(sticker);

      if(sticksGroup.length > 0)
        albumView.colectionStickers[i] = sticksGroup;
    }

    return albumView;
  }

}