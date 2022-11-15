import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomMessageChat extends StatelessWidget {
  const BottomMessageChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(height: 0.1),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 5),
          child: Row(
            children:  <Widget>[
              Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Escreva uma mensagem...",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(90.0),),  
                ),
                style: TextStyle(height: 0.5),
              )
              ),
              SizedBox(
                width: 6,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xff9A1032),
                child: IconButton(
                      onPressed: () {},
                      icon: const ImageIcon(
                        AssetImage('assets/images/send_image.png'),
                        color: Colors.white, 
                        size: 45,
                      ),
                  ),
              )
            ],
          ),
        ),
        Divider(height: 2),
        SizedBox(
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal:8),
            children: [
              TextButton(
                  onPressed: (){}, child: Text(
                    "Trocar figurinhas",
                     style: TextStyle(fontSize: 14, color: Colors.black)),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    side: BorderSide(color: Color(0xff9A1032)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                  ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                    
                    onPressed: (){}, child: Text(
                      "Trocar figurinhas",
                       style: TextStyle(fontSize: 14, color: Colors.black)),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      side: BorderSide(color: Color(0xff9A1032)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                    ),
                ),
              ),

              TextButton(
                  onPressed: (){}, child: Text(
                    "Trocar figurinhas",
                     style: TextStyle(fontSize: 14, color: Colors.black)),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    side: BorderSide(color: Color(0xff9A1032)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                  ),
              )
            ],
          ),
        )



        /*Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.zero,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: (){}, child: Text(
                  "Trocar figurinhas",
                   style: TextStyle(fontSize: 18, color: Colors.black)),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  side: BorderSide(color: Color(0xff9A1032)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                ),
              ),

              TextButton(
                onPressed: (){}, child: Text("Combinar local"),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    decorationColor: Colors.black
                    ),
                  side: BorderSide(color: Color(0xff9A1032)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                ),
              ),

              TextButton(
                onPressed: (){}, child: Text("teste"),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  textStyle: TextStyle(fontSize: 18),
                  side: BorderSide(color: Color(0xff9A1032)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                ),
                
              ),
            ],
          ),
        )*/
      ],
    );
  }
}
