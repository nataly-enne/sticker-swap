import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/core/user.dart';

class HeaderSticker extends StatelessWidget {
  final User user;
  final Function() openFilter;

  const HeaderSticker({
    Key? key,
    required this.user,
    required this.openFilter
  }) : super(key: key);

  final double heightBackground = 180;
  final double heightProfile = 130;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Ink(
            height: heightBackground,
            color: Theme.of(context).primaryColor,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: openFilter,
                  icon: const ImageIcon(
                    AssetImage('assets/images/icon_bars.png'),
                    color: Colors.white,
                  ),
              )
            ],
          ),
          Positioned(
            top: heightBackground - (85 % heightProfile),
            left: 40,
            child: buildProfileImage(),
          )
        ],
      ),
    );
  }
}

Widget buildProfileImage() => const CircleAvatar(
      radius: 55,
      backgroundColor: Colors.white,
      backgroundImage: AssetImage('assets/images/profile_picture.png'),
    );
