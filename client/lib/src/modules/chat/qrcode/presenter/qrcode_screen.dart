import 'package:flutter/material.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Trocar Figurinhas'),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                      child: const Text(
                        textAlign: TextAlign.center,
                        'Leia o QR Code para ver quais figurinhas você pode receber. Apenas figurinhas extras serão consideradas na troca.',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 60, 25, 40),
                    child: Image.asset('assets/images/qrcode.png'),
                  ),
                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Gerar Qr Code'),
                      onPressed: () async {},
                    )
                  ),
                ],
              ),
            )));
  }
}
