import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class FilterModesUtils{
  static bool all(Sticker sticker)=> true;
  static bool onlyMissing(Sticker sticker)=> sticker.quantity == 0;
  static bool onlyRepeated(Sticker sticker)=> sticker.quantity > 1;
  static bool onlyObtained(Sticker sticker)=> sticker.quantity > 0;
}