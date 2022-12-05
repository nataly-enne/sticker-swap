// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album()
  ..collectionStickers =
      (json['collectionStickers'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(
        int.parse(k),
        (e as List<dynamic>)
            .map((e) => Sticker.fromJson(e as Map<String, dynamic>))
            .toList()),
  );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'collectionStickers':
          instance.collectionStickers.map((k, e) => MapEntry(k.toString(), e)),
    };
