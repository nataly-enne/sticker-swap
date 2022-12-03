import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class LoginBloc{
  void verifyAuth()=> Modular.to.pushReplacementNamed("/home/");
  void toRegisterScreen()=> Modular.to.pushNamed("/register/");
  void toRecoverScreen()=> Modular.to.pushNamed("/recover/");

  Future<Map?> login(email, password) async{
    Dio dio = new Dio();
    var response = await dio.post(dotenv.env['API_URI']! + '/api/login', data: {'email': email, 'password': password});
    debugPrint(dotenv.env['API_URI']);
    if(response.statusCode == 201){
      var decodedResponse = response.data as Map;
      //debugPrint(decodedResponse['token']);
      return decodedResponse;
    }

    return null;
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
}
