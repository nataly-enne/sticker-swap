import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/core/entities/auth.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

import '../../infra/models/sticker_model.dart';

abstract class IGetAlbum{

  Future<Album> call({required User user, required  Auth auth});

}

  Future<Map<String, dynamic>> getAlbum(userId, token) async{
    Dio dio = new Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';
    var response = await dio.get('${dotenv.env['API_URI']!}/api/usuario/${userId}/album');
    if(response.statusCode == 200){
      var decodedResponse = response.data as Map<String, dynamic>;
      //debugPrint(decodedResponse['token']);
      return decodedResponse;
    }

    return Map<String, dynamic>();
  }


  Future<Map?> postAlbum(userId, album) async{
    Dio dio = new Dio();
    var response = await dio.post('${dotenv.env['API_URI']!}/api/usuario/${userId}/album', data: {"collectionStickers": album['collectionStickers']});
    if(response.statusCode == 200){
      var decodedResponse = response.data as Map;
      //debugPrint(decodedResponse['token']);
      return decodedResponse;
    }

    return null;
  }

    Future<Map?> putAlbum(userId, album, token) async{
    Dio dio = new Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';
    var response = await dio.put('${dotenv.env['API_URI']!}/api/usuario/${userId}/album', data: {"collectionStickers": album['collectionStickers']});
    if(response.statusCode == 201){
      var decodedResponse = response.data as Map;
      //debugPrint(decodedResponse['token']);
      return decodedResponse;
    }

    return null;
  }
  
class GetAlbumImpl extends IGetAlbum{
  @override
  Future<Album> call({required User user, required  Auth auth}) async{
    Album album = Album();

    Map<int, List<StickerModel>> collectionStickers = Map();

    var response = await getAlbum(user.id, auth.token);

    album = Album.fromJson(response);

    // album.collectionStickers = collectionStickers ;

    return album;
  }
}