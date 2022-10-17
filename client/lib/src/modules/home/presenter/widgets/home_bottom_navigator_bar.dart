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
          icon: ImageIcon(AssetImage('assets/images/icon_home.png')),
          label: "",
          tooltip: "Tela Inicial"
      ),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/icon_figure.png')),
          label: "",
          tooltip: "Escrever..."
      ),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/icon_change.png')),
          label: "",
          tooltip: "Escrever..."
      ),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/icon_mix.png')),
          label: "",
          tooltip: "Escrever..."
      ),
    ],
  );
}