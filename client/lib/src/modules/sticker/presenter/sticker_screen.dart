import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker_group.dart';
import 'package:sticker_swap_client/src/modules/sticker/presenter/sticker_bloc.dart';
import 'package:sticker_swap_client/src/modules/sticker/presenter/widgets/element_sticker.dart';
import 'package:sticker_swap_client/src/modules/sticker/presenter/widgets/group_sticker.dart';
import 'package:sticker_swap_client/src/modules/sticker/presenter/widgets/header_sticker.dart';
import 'package:sticker_swap_client/src/modules/sticker/presenter/widgets/search_sticker.dart';
import 'package:sticker_swap_client/src/modules/sticker/presenter/widgets/sticker_album_progress.dart';

class StickerScreen extends StatefulWidget {
  const StickerScreen({Key? key}) : super(key: key);

  @override
  State<StickerScreen> createState() => _StickerScreenState();
}

class _StickerScreenState extends ModularState<StickerScreen, StickerBloc> {

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          HeaderSticker(),
          StickerAlbumProgress(
              porcentagemCompleta: controller.porcentagemCompleta
          ),
          SearchSticker(
            controller: controller.searchController,
            onSearch: controller.searchSticker,
          ),


          //Os widgets abaixo são apenas para montar, não serão usados dessa
          // forma quando forem para o modelo real

          Row(
            children: [
              GroupSticker(
                group: StickerGroup(
                  id: 0,
                  image: "https..."
                ),
                onTap: controller.selectGroup,
              ),
            ],
          ),

          Divider(height: 20,),

          Row(
            children: [
              ElementSticker(
                sticker: Sticker(id: 0, text: "BRA 20", idGroup: 0, quantity: 1),
                addSticker: controller.addSticker,
                removeSticker: controller.removeSticker,
              )
            ],
          ),
        ],
      ),
    );
  }
}
