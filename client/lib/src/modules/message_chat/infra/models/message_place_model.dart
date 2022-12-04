import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_place.dart';

class MessagePlaceModel extends MessagePlace {
  MessagePlaceModel({
    required super.time,
    required super.place,
    required super.status,
    required String date,
    required super.id,
    required super.idSender
  }) : super(date: date);

  factory MessagePlaceModel.fromMap(Map<String, dynamic> map) {
    return MessagePlaceModel(
      id: map['id'],
      time: map['time'],
      date: map['date'],
      place: map['place'],
      status: map['status'],
      idSender: map['idSender'],
    );
  }
}
