import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/mark_location/presenter/mark_location_bloc.dart';
import 'package:sticker_swap_client/src/modules/mark_location/presenter/mark_location_screen.dart';

class MarkLocationModule extends WidgetModule{
  @override
  List<Bind> get binds => [
    Bind<MarkLocationBloc>((i)=> MarkLocationBloc()),
  ];

  @override
  // TODO: implement view
  Widget get view => MarkLocationScreen();
}