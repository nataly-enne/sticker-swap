import 'package:sticker_swap_client/src/core/album.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

abstract class IGetAlbum{

  Future<Album> call({required idUser});

}

class GetAlbumImpl extends IGetAlbum{
  @override
  Future<Album> call({required idUser}) async{
    Album album = Album();

    album.colectionStickers = {
      0 : [
        Sticker(id: 0, text: "00", idGroup: 0, quantity: 0),
        Sticker(id: 2, text: "FWC 1", idGroup: 0, quantity: 0),
        Sticker(id: 3, text: "FWC 2", idGroup: 0, quantity: 1),
        Sticker(id: 4, text: "FWC 3", idGroup: 0, quantity: 0),
        Sticker(id: 5, text: "FWC 4", idGroup: 0, quantity: 3),
        Sticker(id: 5, text: "FWC 5", idGroup: 0, quantity: 2),
        Sticker(id: 5, text: "FWC 6", idGroup: 0, quantity: 0),
        Sticker(id: 5, text: "FWC 7", idGroup: 0, quantity: 2),
      ],
      27 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "BRA $i", idGroup: 27, quantity: i%3),
      ]
    };

    return album;
  }
}