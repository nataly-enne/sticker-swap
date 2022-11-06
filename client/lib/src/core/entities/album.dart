import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class Album{
  Map<int, List<Sticker>> colectionStickers;

  Album() :
    colectionStickers = {
      0: const [],
      1: const [],
      2: const [],
      3: const [],
    };
}