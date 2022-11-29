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
      padding: const EdgeInsets.only(top: 20, left: 30, bottom: 20, right: 30),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
            contentPadding: const EdgeInsets.all(0),
            suffixIcon: IconButton(
                onPressed: onSearch,
                icon: const Icon(Icons.search)
            )
        ),
      ),
    );
  }
}