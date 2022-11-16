import 'package:sticker_swap_client/src/core/entities/album.dart';
import 'package:sticker_swap_client/src/modules/sticker/domain/entities/sticker.dart';

abstract class IGetAlbum{

  Future<Album> call({required int idUser});

}

class GetAlbumImpl extends IGetAlbum{
  @override
  Future<Album> call({required int idUser}) async{
    Album album = Album();

    album.colectionStickers = {
      0 : [
        Sticker(id: 0, text: "00", idGroup: 0, quantity: 0),
        Sticker(id: 2, text: "FWC 1", idGroup: 0, quantity: 0),
        Sticker(id: 3, text: "FWC 2", idGroup: 0, quantity: 1),
        Sticker(id: 4, text: "FWC 3", idGroup: 0, quantity: 0),
        Sticker(id: 5, text: "FWC 4", idGroup: 0, quantity: 3),
        Sticker(id: 5, text: "FWC 5", idGroup: 0, quantity: 2),
        Sticker(id: 5, text: "FWC 6", idGroup: 0, quantity: 0),
        Sticker(id: 5, text: "FWC 7", idGroup: 0, quantity: 2),
      ],
      1 : [
        for(int i=8; i<=17; i++)
          Sticker(id: i, text: "FWC $i", idGroup: 1, quantity: i%2),
      ],
      2 : [
        Sticker(id: 18, text: "FWC 18", idGroup: 2, quantity: 0),
      ],
      3 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "QAT $i", idGroup: 3, quantity: i%3),
      ],
      4 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "ECU $i", idGroup: 4, quantity: i%3),
      ],
      5 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "SEN $i", idGroup: 5, quantity: i%3),
      ],
      6 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "NED $i", idGroup: 6, quantity: i%3),
      ],
      7 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "ENG $i", idGroup: 7, quantity: i%3),
      ],
      8 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "IRN $i", idGroup: 8, quantity: i%3),
      ],
      9 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "USA $i", idGroup: 9, quantity: i%3),
      ],
      10 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "WAL $i", idGroup: 10, quantity: i%3),
      ],
      11 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "ARG $i", idGroup: 11, quantity: i%3),
      ],
      12 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "KSA $i", idGroup: 12, quantity: i%3),
      ],
      13 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "MEX $i", idGroup: 13, quantity: i%3),
      ],
      14 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "POL $i", idGroup: 14, quantity: i%3),
      ],
      15 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "FRA $i", idGroup: 15, quantity: i%3),
      ],
      16 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "AUS $i", idGroup: 16, quantity: i%3),
      ],
      17 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "DEN $i", idGroup: 17, quantity: i%3),
      ],
      18 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "TUN $i", idGroup: 18, quantity: i%3),
      ],
      19 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "ESP $i", idGroup: 19, quantity: i%3),
      ],
      20 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "CRC $i", idGroup: 20, quantity: i%3),
      ],
      21 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "GER $i", idGroup: 21, quantity: i%3),
      ],
      22 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "JPN $i", idGroup: 22, quantity: i%3),
      ],
      23 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "BEL $i", idGroup: 23, quantity: i%3),
      ],
      24 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "CAN $i", idGroup: 24, quantity: i%3),
      ],
      25 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "MAR $i", idGroup: 25, quantity: i%3),
      ],
      26 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "CRO $i", idGroup: 26, quantity: i%3),
      ],
      27 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "BRA $i", idGroup: 27, quantity: i%3),
      ],
      28 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "SRB $i", idGroup: 28, quantity: i%3),
      ],
      29 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "SUI $i", idGroup: 29, quantity: i%3),
      ],
      30 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "CMR $i", idGroup: 30, quantity: i%3),
      ],
      31 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "POR $i", idGroup: 31, quantity: i%3),
      ],
      32 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "GHA $i", idGroup: 32, quantity: i%3),
      ],
      33 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "URU $i", idGroup: 33, quantity: i%3),
      ],
      34 : [
        for(int i=1; i<=20; i++)
          Sticker(id: i, text: "KOR $i", idGroup: 34, quantity: i%3),
      ],
    };

    return album;
  }
}