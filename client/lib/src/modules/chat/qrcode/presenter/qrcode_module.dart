import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/chat/qrcode/presenter/qrcode_bloc.dart';
import 'package:sticker_swap_client/src/modules/chat/qrcode/presenter/qrcode_screen.dart';

class QRCodeModule extends Module{
  @override
  List<Bind> get binds => [
    Bind<QRCodeBloc>((i) => QRCodeBloc()),
  ];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context, args) => const QrCodeScreen()),
  ];
}