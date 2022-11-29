import 'package:flutter_modular/flutter_modular.dart';

class RegisterBloc{
  void verifyAuth()=> Modular.to.pushReplacementNamed("/login/");
}