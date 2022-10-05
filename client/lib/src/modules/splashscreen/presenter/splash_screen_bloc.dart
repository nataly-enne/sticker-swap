import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenBloc{
  void verifyAuth()=> Modular.to.pushReplacementNamed("/login/");
}