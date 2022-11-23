import 'package:flutter_modular/flutter_modular.dart';

class RecoverBloc{
  void verifyAuth()=> Modular.to.pushReplacementNamed("/login/");
}