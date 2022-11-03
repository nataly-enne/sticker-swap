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
import 'package:sticker_swap_client/src/utils/consts/group_names_utils.dart';

class StickerScreen extends StatefulWidget {

  final int idModePage;
  const StickerScreen({Key? key, required this.idModePage})
      : super(key: key);

  @override
  State<StickerScreen> createState() => _StickerScreenState();
}

class _StickerScreenState extends ModularState<StickerScreen, StickerBloc> {

  @override
  void initState() {
    controller.getAlbum();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.setIdModePage(widget.idModePage);

    return Expanded(
      child: ListView(
        children: [
          HeaderSticker(
              user: controller.user,
              openFilter: controller.openFilter
          ),
          StreamBuilder<bool>(
            stream: controller.getStatus,
            builder: (_, snapshot) {
              return StickerAlbumProgress(
                unicas: controller.albumManager.unicas,
                obitidas: controller.albumManager.obtidas,
                repetidas: controller.albumManager.repetidas,
              );
            }
          ),
          SearchSticker(
            controller: controller.searchController,
            onSearch: controller.searchSticker,
          ),


          //Os widgets abaixo são apenas para montar, não serão usados dessa
          // forma quando forem para o modelo real

          StreamBuilder(
              initialData: widget.idModePage,
              stream: bloc.getIdModePage,
              builder: (_, snapshot) {
                if(snapshot.data == 0) {
                  return Row(
                    children: [
                      GroupSticker(
                        group: StickerGroup(
                            id: 0,
                            name: "[BRA]\nBarsil",
                            image: "https..."
                        ),
                        onTap: controller.selectGroup,
                      ),
                    ],
                  );
                } else {
                  return _listStickersView();
                }
              },
          ),
        ],
      ),
    );
  }


  Column _listStickersView(){
    return Column(
      children: [
       for(int i =0; i < 38; i++)
         if(controller.albumManager.albumView!.colectionStickers.containsKey(i))
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
             child: Wrap(
               direction: Axis.horizontal,
               alignment: WrapAlignment.start,
               children: [
                 Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.fromLTRB(8, 6, 0, 4),
                       child: Text(
                         GroupNamesUtils.names[i]!,
                         style: const TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 17
                         ),
                       ),
                     ),
                   ],
                 ),

                 for(Sticker sticker in (controller.albumManager.albumView!.colectionStickers[i] as List<Sticker>))
                   ElementSticker(
                     sticker: sticker,
                     addSticker: controller.addSticker,
                     detailsSticker: controller.detailsSticker,
                   ),
               ],
             ),
           ),
      ]
    );
  }


}
