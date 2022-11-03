
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker_group.dart';

class GroupStickerUtils{

  static List<StickerGroup> list = [
    StickerGroup(id: -1, name: "Ver\ntodas", image: 'assets/images/icone_todas.png', isImageIcon: true),
    StickerGroup(id: 1, name: "[FWC]\nEstádios", image: 'assets/images/icones_estadio.png', isImageIcon: true),
    StickerGroup(id: 0, name: "[FWC]\nEspeciais", image: 'assets/images/icone_especiais.png', isImageIcon: true),
    StickerGroup(id: 2, name: "[FWC]\nBola", image: 'assets/images/icone_bola.png', isImageIcon: true),
    StickerGroup(id: 4, name: "[ECU]\nEquador", image: "https://bandeira.net/wp-content/uploads/2018/08/bandeira-do-equador.png"),
    StickerGroup(id: 26, name: "[BRA]\nBrasil", image: "https://www.curitiba.pr.leg.br/atividade-parlamentar/legislacao/imagens/bandeira-do-brasil.png/image"),
  ];


}