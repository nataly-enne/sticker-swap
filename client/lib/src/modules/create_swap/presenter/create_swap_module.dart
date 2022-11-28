import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_bloc.dart';
import 'package:sticker_swap_client/src/modules/create_swap/presenter/create_swap_screen.dart';

class CreateSwapModule extends WidgetModule{

  @override
  List<Bind<Object>> get binds => [
    Bind<CreateSwapBloc>((i)=> CreateSwapBloc()),
  ];

  @override
  Widget get view => CreateSwapScreen();

}