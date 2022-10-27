import 'package:flutter/material.dart';

class SearchSticker extends StatelessWidget {
  const SearchSticker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: (){},
              icon: Icon(Icons.search)
          )
        ),
      ),
    );
  }
}
