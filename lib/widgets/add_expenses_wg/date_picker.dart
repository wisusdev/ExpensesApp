import 'package:exp_app/models/combined_model.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
    final CombinedModel cModel;

    const DatePicker({Key? key, required this.cModel}) : super(key: key);

    @override
    State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
    @override
    Widget build(BuildContext context) {
        return Row(
            children: [
                DateContainerWidget(cModel: widget.cModel, name: 'Hoy', isSelected: true)
            ],
        );
    }
}

class DateContainerWidget extends StatelessWidget {

    final CombinedModel cModel;
    final String name;
    final bool isSelected;

    const DateContainerWidget({Key? key, required this.cModel, required this.name, required this.isSelected}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0)
                    ),
                    child: Center(
                        child: Text(name),
                    ),
                ),
                FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text('${cModel.year}/${cModel.month}/${cModel.day}'),
                ),
            ],
        );
    }
}