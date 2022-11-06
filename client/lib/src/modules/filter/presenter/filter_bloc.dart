import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';
import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/core/entities/album_manager.dart';
import 'package:sticker_swap_client/src/modules/filter/domain/entities/filter.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/utils/consts/filter_modes_utils.dart';

class FilterBloc{

  Filter filter = Modular.get<Filter>();
  AlbumManager albumManager = Modular.get<AlbumManager>();

  final BehaviorSubject<int> _modeFilterStream = BehaviorSubject.seeded(0);
  final BehaviorSubject<bool> _loadingStream = BehaviorSubject.seeded(false);

  Stream<int> get getModeFilter => _modeFilterStream.stream;
  Stream<bool> get isLoading => _loadingStream.stream;

  void initFilter(){
    _modeFilterStream.sink.add(filter.modeFilter);
  }

  void setFilter(int? modeFilter){
    filter.setFilterAlbum(modeFilter!);
    _modeFilterStream.sink.add(modeFilter);
  }

  void filterStickers(){
    _loadingStream.sink.add(true);
    bool Function(Sticker) functionFilter = FilterModesUtils.filterFunction[filter.modeFilter] as bool Function(Sticker);

    Album album = applyFliter(albumManager.album, functionFilter);
    albumManager.setAlbumView(album);

    _loadingStream.sink.add(false);

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

  void dispose(){
    _loadingStream.close();
    _modeFilterStream.close();
  }

}