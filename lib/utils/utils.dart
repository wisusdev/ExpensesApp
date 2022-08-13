import 'package:expenses_app/utils/icon_list.dart';
import 'package:flutter/material.dart';

extension ColorCategory on String {
    toColor(){
        String hexColor = replaceAll('#', '');
        if (hexColor.length == 6) {
            hexColor = 'FF$hexColor';
        }

        if (hexColor.length == 8) {
            return Color(int.parse('0x$hexColor'));
        }
    }
}

extension IconCategory on String {
    toIcon(){
        return IconList().iconMap[this];
    }
}