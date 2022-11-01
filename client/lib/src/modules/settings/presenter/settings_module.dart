import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/settings/presenter/settings_bloc.dart';
import 'package:sticker_swap_client/src/modules/settings/presenter/settings_screen.dart';

class SettingsModule extends WidgetModule{
  @override
  List<Bind<Object>> get binds => [
    Bind<SettingsBloc>((i) => SettingsBloc())
  ];

  @override
  Widget get view => const SettingsScreen();

}