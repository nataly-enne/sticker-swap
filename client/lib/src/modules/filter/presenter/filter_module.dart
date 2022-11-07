import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/filter/presenter/filter_bloc.dart';
import 'package:sticker_swap_client/src/modules/filter/presenter/filter_screen.dart';

class FilterModule extends WidgetModule{
  @override
  List<Bind<Object>> get binds => [
    Bind<FilterBloc>((i)=> FilterBloc())
  ];

  @override
  Widget get view => FilterScreen();

}