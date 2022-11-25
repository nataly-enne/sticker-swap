import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/core/components/app_bar_bottom_sheet.dart';
import 'package:sticker_swap_client/src/modules/mark_location/presenter/widgets/input_mark_location.dart';

class MarkLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBarBottomSheet("Marcar local", context),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InputMarkLocation(hintText: "Inisira o local",),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                flex: 9,
                child: InputMarkLocation(hintText: "Inisira data",)
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                  flex: 9,
                  child: InputMarkLocation(hintText: "Inisira hora",)
              )
            ],
          ),
        ),
      ],
    );
  }
}
