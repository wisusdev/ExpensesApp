import 'package:flutter/material.dart';

class PageAnimation extends PageRouteBuilder {
    final Widget widget;
    final double ejeX;
    final double ejeY;

    PageAnimation({ required this.widget, required this.ejeX, required this.ejeY }) : super (
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (BuildContext context, Animation<double> firstAnimation, Animation<double> secondAnimation, Widget child) {
            firstAnimation = CurvedAnimation(parent: firstAnimation, curve: Curves.easeOutBack);
            return ScaleTransition(
                alignment: Alignment(ejeX, ejeY),
                scale: firstAnimation, 
                child: child,
            );
        },
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation,) {
            return widget;
        }
    );
}