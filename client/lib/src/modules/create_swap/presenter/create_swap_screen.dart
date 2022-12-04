import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/core/components/app_bar_bottom_sheet.dart';

class CreateSwapScreen extends StatefulWidget {
  @override
  _CreateSwapScreenState createState() => _CreateSwapScreenState();
}

class _CreateSwapScreenState extends State<CreateSwapScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBarBottomSheet("Figurinhas de troca", context),
        Container(
            width: 400,
            padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
            margin: EdgeInsets.only(left: 30, right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/info_icon.png',
                  height: 25,
                ),
                SizedBox(
                  width: 25,
                ),
                const Text(
                  "Selecione as figurinhas que\n deseja trocar",
                  style: TextStyle(color: Color.fromRGBO(70, 98, 235, 1)),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "[FWC] Especiais",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Expanded(child: cardButton(name: '00')),
          Expanded(child: cardButton(name: 'FWC 1')),
          Expanded(child: cardButton(name: 'FWC 2')),
          Expanded(child: cardButton(name: 'FWC 3')),
        ]),


        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "[FWC] Brasil",
            style: TextStyle(fontSize: 18),
          ),
        ),


        Row(children: <Widget>[
          Expanded(
            child: cardButton(name: 'BRA 2'),
          ),
          Expanded(
            child: cardButton(name: 'BRA 3'),
          ),
          Expanded(
            child: cardButton(name: 'BRA 4'),
          ),
          Expanded(
            child: cardButton(name: 'BRA 5'),
          )
        ]),


        
        Align(
          alignment: Alignment.bottomCenter,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              backgroundColor: Color.fromRGBO(154, 16, 50, 1),
              side: BorderSide(color: Color(0xff9A1032)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
            child: const Text("Confirmar",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }
}

class cardButton extends StatefulWidget {
  cardButton({super.key, required this.name});

  final String name;
  bool selected = false;

  @override
  State<cardButton> createState() => _cardButtonState();
}

class _cardButtonState extends State<cardButton> {
  Color _colorButton = Colors.transparent;
  Color _colorText = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      leading: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              side: BorderSide(color: Colors.black),
              backgroundColor: _colorButton),
          onPressed: () {
            setState(() {
              widget.selected = !widget.selected;
              if (widget.selected == false) {
                _colorButton = Colors.transparent;
                _colorText = Colors.black;
              } else {
                _colorButton = Color.fromRGBO(154, 16, 50, 1);
                _colorText = Colors.white;
              }
            });
          },
          child: Text(
            widget.name,
            style: TextStyle(color: _colorText),
          )),
    ));
  }
}
