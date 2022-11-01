import 'package:sticker_swap_client/src/core/album.dart';

abstract class IGetAlbum{

  Future<Album> call({required idUser});

}

class GetAlbumImpl extends IGetAlbum{
  @override
  Future<Album> call({required idUser}) async{
    return Album();
  }
}