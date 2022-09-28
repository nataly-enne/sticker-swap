import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/login/presenter/login_screen.dart';

class AppModule extends Module{
  @override
  List<Bind> get binds => [
    Bind<Dio>((i)=>Dio())
  ];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context, args) => LoginDemo()),
  ];

}