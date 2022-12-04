import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/app.dart';
import 'package:sticker_swap_client/src/app_module.dart';

void main()async{
  //await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ModularApp(module: AppModule(), child: App(),));
}
