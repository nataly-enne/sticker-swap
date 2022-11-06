import 'package:sticker_swap_client/src/utils/consts/filter_modes_utils.dart';

class Filter{
  bool filterOn = false;
  int modeFilter = FilterModesUtils.all;

  void setFilterAlbum(int modeFilte){
    this.modeFilter = modeFilte;
    this.filterOn = modeFilte != FilterModesUtils.all;
  }

}