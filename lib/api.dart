import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String?> login(email, password) async{
  var response = await http.post(Uri.https(dotenv.env['API_URI']!, 'login'), body: {'email': email, 'password': password});
  debugPrint(dotenv.env['API_URI']);

  if(response.statusCode == 200){
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    return decodedResponse['token'];
  }

  return null;
}

Future<String?> getRandomNumber(token) async{
  var response = await http.get(Uri.https(dotenv.env['API_URI']!, 'randomnumber'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  debugPrint(dotenv.env['API_URI']);

  if(response.statusCode == 200){
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    return decodedResponse['randomnumber'];
  }

  return null;
}


