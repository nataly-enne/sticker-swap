import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

class StickerModel extends Sticker {
  StickerModel(
      {required super.id,
      required super.text,
      required super.idGroup,
      required super.quantity});

  factory StickerModel.fromMap(Map<String, dynamic> map) {
    return StickerModel(
      id: map['id'],
      text: map['text'],
      idGroup: map['idGroup'],
      quantity: map['quantity'],
    );
  }
}
