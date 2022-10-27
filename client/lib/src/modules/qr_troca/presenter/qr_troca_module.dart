import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/qr_troca/presenter/qr_troca_bloc.dart';
import 'package:sticker_swap_client/src/modules/qr_troca/presenter/qr_troca_screen.dart';

class QrTrocaModule extends WidgetModule{
  @override
  List<Bind<Object>> get binds => [
    Bind<QrTrocaBloc>((i)=> QrTrocaBloc())
  ];

  @override
  Widget get view => QrTrocaScreen();

}