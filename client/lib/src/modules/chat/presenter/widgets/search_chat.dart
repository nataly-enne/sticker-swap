import 'package:flutter/material.dart';

class SearchChat extends StatelessWidget {
  final TextEditingController controller;
  final Function() onSearch;
  const SearchChat({
    Key? key,
    required this.onSearch,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: onSearch,
                icon: Icon(Icons.search)
            )
        ),
      ),
    );
  }
}