import 'package:sticker_swap_client/src/core/album.dart';

class AlbumManager{
  Album album;
  Album? albumView;

  AlbumManager() : album = Album();

  void setBaseAlbum(Album otherAlbum){
    album = otherAlbum;
    albumView = otherAlbum;
  }


}