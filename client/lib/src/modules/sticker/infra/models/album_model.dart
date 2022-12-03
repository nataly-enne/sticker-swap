import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/sticker/infra/models/sticker_model.dart';

class AlbumModel extends Album{

  static AlbumModel albumFromJson(Map<String, dynamic> json) {
    AlbumModel albumModel = AlbumModel();

    for(int group =0; group <38; group++){
      if(json.containsKey("$group")){
        albumModel.colectionStickers[group] =
            StickerModel.listFromJson(json["$group"]);
      }
    }

    return albumModel;
  }
  
  
}