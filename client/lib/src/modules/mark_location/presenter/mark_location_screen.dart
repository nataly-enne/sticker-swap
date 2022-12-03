import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/core/components/app_bar_bottom_sheet.dart';
import 'package:sticker_swap_client/src/modules/mark_location/presenter/mark_location_bloc.dart';
import 'package:sticker_swap_client/src/modules/mark_location/presenter/widgets/input_mark_location.dart';

class MarkLocationScreen extends StatefulWidget {
  @override
  _MarkLocationScreenState createState() => _MarkLocationScreenState();
}

class _MarkLocationScreenState extends ModularState<MarkLocationScreen, MarkLocationBloc> {


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBarBottomSheet("Marcar local", context),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InputMarkLocation(
            hintText: "Escreva o local",
            inputType: TextInputType.text,
            controller: controller.placeController,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                  flex: 9,
                  child: InputMarkLocation(
                    hintText: "Escreva a data",
                    inputType: TextInputType.datetime,
                    controller: controller.dateController,
                  )
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                  flex: 9,
                  child: InputMarkLocation(
                    hintText: "Escreva o horário",
                    inputType: TextInputType.number,
                    controller: controller.timeController,
                  )
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
                onPressed: controller.sendMessage,
                child: const Text("Enviar")),
          ),
        )

      ],
    );
  }

}