import 'package:flutter/material.dart';

class HeaderSticker extends StatelessWidget {
  const HeaderSticker({Key? key}) : super(key: key);

  final double heightBackground = 200;
  final double heightProfile = 130;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          height: heightBackground,
          color: Theme.of(context).primaryColor,
          margin: const EdgeInsets.only(bottom: 25),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(25),
          child: Image.asset('assets/images/icon_bars.png'),
        ),
        Positioned(
          top: heightBackground - (85 % heightProfile),
          left: 25,
          child: buildProfileImage(),
        )
      ],
    );
  }
}

Widget buildProfileImage() => const CircleAvatar(
      radius: 55,
      backgroundColor: Colors.grey,
      backgroundImage: AssetImage('assets/images/profile_picture.png'),
    );
