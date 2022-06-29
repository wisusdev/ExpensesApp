import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
    int _bottomNavigationBarIndex = 0;

    int get bottomNavigationBarIndex => _bottomNavigationBarIndex;

    set bottomNavigationBarIndex(int index){
        _bottomNavigationBarIndex = index;
        notifyListeners();
    }
}