import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

import '../../infra/models/sticker_model.dart';

abstract class IGetAlbum{

  Future<Album> call({required int idUser});

}

  Future<Map?> getAlbum(userId) async{
    Dio dio = new Dio();
    var response = await dio.get('${dotenv.env['API_URI']!}/api/usuario/${userId}/album');
    if(response.statusCode == 201){
      var decodedResponse = response.data as Map;
      //debugPrint(decodedResponse['token']);
      return decodedResponse;
    }

    return null;
  }


  Future<Map?> postAlbum(userId, collectionStickers) async{
    Dio dio = new Dio();
    var response = await dio.post('${dotenv.env['API_URI']!}/api/usuario/${userId}/album', data: {'collectionStickers': collectionStickers});
    if(response.statusCode == 201){
      var decodedResponse = response.data as Map;
      //debugPrint(decodedResponse['token']);
      return decodedResponse;
    }

    return null;
  }

    Future<Map?> putAlbum(userId, collectionStickers) async{
    Dio dio = new Dio();
    var response = await dio.put('${dotenv.env['API_URI']!}/api/usuario/${userId}/album', data: {'collectionStickers': collectionStickers});
    if(response.statusCode == 201){
      var decodedResponse = response.data as Map;
      //debugPrint(decodedResponse['token']);
      return decodedResponse;
    }

    return null;
  }
  
class GetAlbumImpl extends IGetAlbum{
  @override
  Future<Album> call({required int idUser}) async{
    Album album = Album();

    Map<int, List<StickerModel>> collectionStickers = Map();

    var response = await getAlbum(idUser);

    for (int i = 0; i<38; i++){
      collectionStickers[i] = StickerModel.listFromJson(response!['collectionStickers'][i]);
    }

    album.colectionStickers = collectionStickers ;

    return album;
  }
}