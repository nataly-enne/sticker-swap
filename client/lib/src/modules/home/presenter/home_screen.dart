import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
        ),
        child: StreamBuilder<int>(
            initialData: 0,
            stream: controller.getIndexTela,
            builder: (_, snapshot) {
              return Scaffold(
                bottomNavigationBar: HomeBottomNavigatorBar(
                  onTap: controller.mudarTela,
                  indexTelaAtual: snapshot.data!,
                  selectedIconColor: Theme.of(context).primaryColor,
                ),
              );
            }
        )
    );
  }
}
