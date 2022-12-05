import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/usecases/generate_base_album.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/usecases/get_album.dart';

class RegisterBloc{
  void verifyAuth()=> Modular.to.pushReplacementNamed("/login/");

  Future<Map?> register(email, password) async{
    Dio dio = new Dio();
    var response = await dio.post(dotenv.env['API_URI']! + '/api/cadastro', data: {'email': email, 'password': password});
    debugPrint(dotenv.env['API_URI']);
    var decodedResponse = response.data as Map;
    debugPrint(decodedResponse.toString());
    if(response.statusCode == 201){
      
      return decodedResponse;
    }
    decodedResponse['status'] = response.statusCode;
    return decodedResponse;
  }

  Future<String?> getRandomNumber(token) async{
    Dio dio = new Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';

    var response = await dio.get(dotenv.env['API_URI']! + 'api/randomnumber');
    //debugPrint(dotenv.env['API_URI']);

    if(response.statusCode == 200){
      var decodedResponse = response.data as Map;
      return decodedResponse['randomNumber'];
    }

    return null;
  }

  void setUpAlbum(userId){
    Album novo = generateAlbum();
    // debugPrint(novo.toJson().toString());
    postAlbum(userId, novo.toJson());
  }
}