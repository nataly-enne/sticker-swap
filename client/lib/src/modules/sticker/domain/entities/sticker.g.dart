// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sticker _$StickerFromJson(Map<String, dynamic> json) => Sticker(
      id: json['id'] as int,
      text: json['text'] as String,
      idGroup: json['idGroup'] as int,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$StickerToJson(Sticker instance) => <String, dynamic>{
      'id': instance.id,
      'idGroup': instance.idGroup,
      'text': instance.text,
      'quantity': instance.quantity,
    };
