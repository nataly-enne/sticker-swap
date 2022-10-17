import 'package:flutter/material.dart';

class HomeBottomNavigatorBar extends BottomNavigationBar{
  HomeBottomNavigatorBar({required Color selectedIconColor}): super(
    currentIndex: 0,
    onTap: (value){print(value);},

    showSelectedLabels: false,
    showUnselectedLabels: false,

    selectedIconTheme: IconThemeData(color: selectedIconColor),
    unselectedIconTheme: const IconThemeData(color: Colors.black),

    items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
          tooltip: "Tela Inicial"
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.confirmation_num),
          label: "",
          tooltip: "Escrever..."
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.swap_horiz),
          label: "",
          tooltip: "Escrever..."
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.tune),
          label: "",
          tooltip: "Escrever..."
      ),
    ],
  );
}