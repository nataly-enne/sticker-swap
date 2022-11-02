import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/usecases/get_album.dart';
import 'package:sticker_swap_client/src/modules/sticker/presenter/sticker_bloc.dart';
import 'package:sticker_swap_client/src/modules/sticker/presenter/sticker_screen.dart';

class StickerModule extends WidgetModule{

  int idModePage;
  StickerModule({super.key, required this.idModePage});

  @override
  List<Bind<Object>> get binds => [
    Bind<StickerBloc>((i)=> StickerBloc()),

    Bind<IGetAlbum>((i)=> GetAlbumImpl()),
  ];

  @override
  Widget get view => StickerScreen(idModePage: idModePage,);

}