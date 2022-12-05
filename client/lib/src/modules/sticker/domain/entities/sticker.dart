import 'package:json_annotation/json_annotation.dart';
part 'sticker.g.dart';

@JsonSerializable()
class Sticker {
  int id;
  int idGroup;
  String text;
  int quantity;
  Sticker(
      {required this.id,
      required this.text,
      required this.idGroup,
      required this.quantity});
  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "text": this.text,
      "idGroup": this.idGroup,
      "quantity": this.quantity,
    };
  }

  factory Sticker.fromJson(Map<String, dynamic> json) => _$StickerFromJson(json);
  Map<String, dynamic> toJson() => _$StickerToJson(this);
}
