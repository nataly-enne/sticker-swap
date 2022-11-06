import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/filter/presenter/filter_bloc.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends ModularState<FilterScreen, FilterBloc> {

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(value: true, onChanged: (value){}, title: Text("Mostrar todos"),),
        TextButton(onPressed: controller.filterStickers, child: Text("Filtrar"))
      ],
    );
  }
}
