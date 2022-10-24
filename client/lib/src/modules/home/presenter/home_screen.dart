import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/home/presenter/home_bloc.dart';
import 'package:sticker_swap_client/src/modules/home/presenter/widgets/home_bottom_navigator_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ModularState<HomeScreen, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeBottomNavigatorBar(
          selectedIconColor: Theme.of(context).primaryColor
      ),
    );
  }
}
