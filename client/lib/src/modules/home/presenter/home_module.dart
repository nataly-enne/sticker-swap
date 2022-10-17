import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/home/presenter/home_bloc.dart';
import 'package:sticker_swap_client/src/modules/home/presenter/home_screen.dart';

class HomeModule extends Module{
  @override
  List<Bind> get binds => [
    Bind<HomeBloc>((i) => HomeBloc())
  ];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context, args) => const HomeScreen()),
  ];
}