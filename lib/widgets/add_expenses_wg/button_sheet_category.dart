import 'package:expenses_app/models/combined_model.dart';
import 'package:expenses_app/utils/utils.dart';
import 'package:expenses_app/widgets/add_expenses_wg/category_list.dart';
import 'package:flutter/material.dart';


class ButtonSheetCategory extends StatefulWidget {

    final CombinedModel cModel;

    const ButtonSheetCategory({Key? key, required this.cModel}) : super(key: key);

    @override
    State<ButtonSheetCategory> createState() => _ButtonSheetCategoryState();
}

class _ButtonSheetCategoryState extends State<ButtonSheetCategory> {
    @override
    Widget build(BuildContext context) {

        bool hasData = false;

        if (widget.cModel.category != 'Selecciona una categoría') {
            hasData = true;
        }

        return GestureDetector(
            onTap: (){
                _categorySelected();
            },
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    children: [
                        Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.7,
                                        color: hasData ? widget.cModel.color.toColor() : Theme.of(context).dividerColor 
                                    ),
                                    borderRadius: BorderRadius.circular(4.0)
                                ),
                                child: Center(
                                    child: Text(widget.cModel.category),
                                ),
                            ),
                        )
                    ],
                ),
            ),
        );
    }

    _categorySelected(){
        var catList = CategoryList().catList;

        var widgets = [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: catList.length,
                itemBuilder: (context, i){

                    var item = catList[i];

                    return ListTile(
                        leading: Icon(
                            item.icon.toIcon(),
                            color: item.color.toColor(),
                            size: 35.0,
                        ),
                        title: Text(item.category),
                        //trailing: const Icon(Icons.radio_button_unchecked_rounded, size: 20.0,),
                        onTap: (){
                            itemSelected(item.category, item.color);
                        },
                    );
                },
            ),
            
            const Divider(thickness: 2.0,),

            ListTile(
                leading: const Icon(Icons.category_rounded, size: 35.0,),
                title: const Text('Crear nueva categoría'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 20.0,),
                onTap: (){
                    Navigator.pop(context);
                },
            ),

            ListTile(
                leading: const Icon(Icons.tune_rounded, size: 35.0,),
                title: const Text('Administrar categoría'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 20.0,),
                onTap: (){
                    Navigator.pop(context);
                },
            )
        ];

        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                ),
            ),
            isScrollControlled: true,
            context: context, 
            builder: (context) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: ListView(
                        children: widgets,
                    ),
                );
            }
        );
    }

    void itemSelected(String category, String color) {
        setState(() {
            widget.cModel.category = category;
            widget.cModel.color = color;
            Navigator.pop(context);
        });
    }
}