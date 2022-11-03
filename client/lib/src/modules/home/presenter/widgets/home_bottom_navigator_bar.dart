import 'package:flutter/material.dart';

class HomeBottomNavigatorBar extends BottomNavigationBar{
  HomeBottomNavigatorBar({
    required int indexTelaAtual,
    required Function(int) onTap,
    required Color selectedIconColor
  }): super(
    onTap: onTap,
    currentIndex: indexTelaAtual,

    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
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
          tooltip: "Figurinhas"
      ),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/icon_change.png')),
          label: "",
          tooltip: "Trocas"
      ),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/icon_mix.png')),
          label: "",
          tooltip: "Configurações"
      ),
    ],
  );
}