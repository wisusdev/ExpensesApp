import 'package:flutter/widgets.dart';

class Constants {

    static sheetBoxDecoration(Color color) {
        return BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)
            )
        );
    }

    static customButton(Color colorDecoration, Color colorBorder, String text){
        return Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 10.0, right: 10.0),
            child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: colorDecoration,
                    border: Border.all(
                        color: colorBorder,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                ),
                child: Center(
                    child: Text(text)
                ),
            ),
        );
    }
}