import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/login/presenter/login_screen.dart';

class LoginModule extends Module{
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context, args) => Login()),
  ];
}