import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('QrCode chat'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 60),
                child: Text(
                  textAlign: TextAlign.center,
                  'Leia o QR Code para iniciar o chat com este usuário.',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
            ),
            QrImage(
              data: "${Modular.get<User>().id}",
              version: QrVersions.auto,
              size: 200.0,
            ),
          ],
        ));
  }
}
