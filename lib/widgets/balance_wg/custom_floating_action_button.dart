import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFloatingActionBottom extends StatelessWidget {
    const CustomFloatingActionBottom({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {

        List<SpeedDialChild> childBottoms = [];

        childBottoms.add(
            SpeedDialChild(
                backgroundColor: Colors.red,
                child: const Icon(Icons.remove),
                label: 'Gastos',
                labelStyle: const TextStyle(fontSize: 18.0),
                onTap: (){
                    //Navigator.push(context, PageAnimation(widget: const AddExpenses(), ejeX: 8.0, ejeY: 0.8));
                    Navigator.pushNamed(context, 'addExpenses');
                }
            ),
        );

        childBottoms.add(
            SpeedDialChild(
                backgroundColor: Colors.green,
                child: const Icon(Icons.add),
                label: 'Ingreso',
                labelStyle: const TextStyle(fontSize: 18.0),
                onTap: (){
                    //Navigator.push(context, PageAnimation(widget: const AddEntries(), ejeX: 8.0, ejeY: 0.8));
                    Navigator.pushNamed(context, 'addEntries');
                }
            ),
        );
 
        return SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.close,
            children: childBottoms,
            spacing: 10.0,
            childMargin: const EdgeInsets.symmetric(horizontal: 8.0),
            childrenButtonSize: const Size(60, 60),
        );
    }
}