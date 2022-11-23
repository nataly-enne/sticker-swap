import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/login/presenter/login_screen.dart';
import 'package:sticker_swap_client/src/modules/recover/presenter/recover_bloc.dart';
import 'package:sticker_swap_client/src/modules/recover/presenter/recover_screen.dart';
import 'package:sticker_swap_client/src/modules/register/presenter/register_bloc.dart';
import 'package:sticker_swap_client/src/modules/register/presenter/register_screen.dart';

class RecoverModule extends Module{
  @override
  List<Bind> get binds => [
    Bind<RecoverBloc>((i) => RecoverBloc()),
  ];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context, args) => RecoverScreen()),
  ];
}