import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/mark_location/presenter/mark_location_bloc.dart';
import 'package:sticker_swap_client/src/modules/mark_location/presenter/mark_location_screen.dart';
import 'package:sticker_swap_client/src/modules/message_chat/domain/entities/message_place.dart';

class MarkLocationModule extends WidgetModule{

  final Function(MessagePlace) markLocation;
  MarkLocationModule({required this.markLocation});

  @override
  List<Bind> get binds => [
    Bind<MarkLocationBloc>((i)=> MarkLocationBloc(markLocation: markLocation)),
  ];

  @override
  Widget get view => MarkLocationScreen();
}