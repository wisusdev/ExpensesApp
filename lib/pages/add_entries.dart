import 'package:flutter/material.dart';

class AddEntries extends StatelessWidget {
    const AddEntries({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Agregar ingresos'),
            ),
            body: const Center(
                child: Text('Aquì sus entradas')
            ),
        );
    }
}