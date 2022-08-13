import 'package:expenses_app/models/combined_model.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
    final CombinedModel cModel;

    const DatePicker({Key? key, required this.cModel}) : super(key: key);

    @override
    State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

    String selectedDay = 'Hoy';

    @override
    void initState() {
        if (widget.cModel.day == 0) {
            widget.cModel.year = DateTime.now().year;
            widget.cModel.month = DateTime.now().month;
            widget.cModel.day = DateTime.now().day;
        } else {
            selectedDay = 'Otro día';
        }
        super.initState();
    }

    @override
    Widget build(BuildContext context) {

        DateTime date = DateTime.now();

        var widgets = <Widget>[];

        _calendar(){
            showDatePicker(
                context: context,
                locale: const Locale('es', 'ES'),
                initialDate: date.subtract(const Duration(hours: 24 * 2)), 
                firstDate: date.subtract(const Duration(hours: 24 * 30)), 
                lastDate: date.add(const Duration(hours: 24 * 30)),
            ).then((value){
                setState(() {
                    if (value != null) {
                        widget.cModel.year = value.year;
                        widget.cModel.month = value.month;
                        widget.cModel.day = value.day;
                    } else {
                        setState(() {
                            selectedDay = 'Hoy';
                        });
                    }
                });
            });
        }

        Map<String, DateTime> items = {
            'Hoy' : date,
            'Ayer' : date.subtract(const Duration(hours: 24)),
            'Otro día' : date
        };

        items.forEach((name, date){
            widgets.add(
                Expanded(
                    child: GestureDetector(
                        onTap: (){
                            setState(() {
                                selectedDay = name;
                                widget.cModel.year = date.year;
                                widget.cModel.month = date.month;
                                widget.cModel.day = date.day;
                                if(name == 'Otro día') _calendar();
                            });
                        },
                        child: DateContainerWidget(cModel: widget.cModel, name: name, isSelected: name == selectedDay),
                    ),
                ),
            );
        });

        return Row(
            children: widgets,
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
        return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                children: [
                    Container(
                        padding: const EdgeInsets.all(14.0),
                        decoration: BoxDecoration(
                            color: isSelected ? Colors.green : Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        child: Center(
                            child: Text(name),
                        ),
                    ),
                    isSelected ? FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('${cModel.year}/${cModel.month}/${cModel.day}'),
                    ) : const Text(''),
                ],
            ),
        );
    }
}