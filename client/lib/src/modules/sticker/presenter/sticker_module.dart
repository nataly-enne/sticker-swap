import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/sticker/presenter/sticker_screen.dart';

class StickerModule extends WidgetModule{
  @override
  List<Bind<Object>> get binds => [];

  @override
  Widget get view => StickerScreen();

}