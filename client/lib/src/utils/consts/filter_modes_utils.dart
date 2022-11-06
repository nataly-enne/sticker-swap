import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class FilterModesUtils{
  static const int all = 0;
  static const int onlyMissing = 1;
  static const int onlyRepeated = 2;
  static const int onlyObtained = 3;


  static Map<int, bool Function(Sticker)> filterFunction = {
    all: (Sticker sticker)=> true,
    onlyMissing: (Sticker sticker)=> sticker.quantity == 0,
    onlyRepeated: (Sticker sticker)=> sticker.quantity > 1,
    onlyObtained: (Sticker sticker)=> sticker.quantity > 0
  };
}