import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/splashscreen/presenter/splash_screen_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ModularState<SplashScreen, SplashScreenBloc> {


  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), controller.verifyAuth);
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Falta fazer o designer"),
      ),
    );
  }
}
