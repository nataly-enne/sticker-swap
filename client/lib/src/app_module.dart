import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/home/presenter/home_module.dart';
import 'package:sticker_swap_client/src/modules/login/presenter/login_module.dart';
import 'package:sticker_swap_client/src/modules/splashscreen/presenter/splash_screen.dart';
import 'package:sticker_swap_client/src/modules/splashscreen/presenter/splash_screen_bloc.dart';
import 'package:sticker_swap_client/src/modules/login/presenter/login_bloc.dart';

class AppModule extends Module{
  @override
  List<Bind> get binds => [
    Bind<Dio>((i)=>Dio()),

    Bind<SplashScreenBloc>((i) => SplashScreenBloc()),
    Bind<LoginBloc>((i) => LoginBloc())
  ];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context, args) => const SplashScreen()),
    ModuleRoute(
        '/login',
        module: LoginModule(),
        transition: TransitionType.fadeIn
    ),
    ModuleRoute(
        '/home',
        module: HomeModule(),
        transition: TransitionType.fadeIn
    )
  ];

}