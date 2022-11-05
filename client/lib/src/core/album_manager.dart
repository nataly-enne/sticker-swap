import 'package:sticker_swap_client/src/core/album.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class AlbumManager{
  Album album;
  Album? albumView;
  int unicas = 0;
  int obtidas = 0;
  int repetidas = 0;

  AlbumManager() : album = Album();

  void setBaseAlbum(Album otherAlbum){
    album = otherAlbum;
    albumView = otherAlbum;

    //Rester dados
    unicas = 0;
    obtidas = 0;
    repetidas = 0;

    //Calcular dados
    for(int i =0; i < 38; i++){
      if(albumView!.colectionStickers.containsKey(i)){
        for(Sticker sticker in (albumView!.colectionStickers[i] as List<Sticker>)) {
          if(sticker.quantity > 0) {
            obtidas += 1;
            repetidas += sticker.quantity - 1;
          }
        }
      }
    }
  }

  void setAlbumView(Album otherAlbum){
    albumView = otherAlbum;
  }

}