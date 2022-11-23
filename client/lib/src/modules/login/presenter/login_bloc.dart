import 'package:flutter_modular/flutter_modular.dart';

class LoginBloc{
  void verifyAuth()=> Modular.to.pushReplacementNamed("/home/");
  void toRegisterScreen()=> Modular.to.pushNamed("/register/");
  void toRecoverScreen()=> Modular.to.pushNamed("/recover/");
}
