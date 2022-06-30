import 'package:exp_app/models/combined_model.dart';
import 'package:exp_app/utils/constans.dart';
import 'package:exp_app/widgets/add_expenses_wg/button_sheet_keyboard.dart';
import 'package:exp_app/widgets/add_expenses_wg/comments_box.dart';
import 'package:flutter/material.dart';

class AddExpenses extends StatelessWidget {
    const AddExpenses({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {

        CombinedModel combinedModel = CombinedModel();

        return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
                FocusScope.of(context).unfocus();
            },
            child: Scaffold(
                appBar: AppBar(
                    title: const Text('Agregar gastos'),
                    elevation: 9.0,
                ),
                body: Column(
                    children: [
                        ButtonSheetKeyboard(cModel: combinedModel,),
            
                        Expanded(
                            child: Container(
                                width: double.infinity,
                                decoration: Constants.sheetBoxDecoration(
                                    Theme.of(context).primaryColorDark
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        const Text('Fecha 12/12/12'),
                                        const Text('Categorìa'),
                                        const Text('Detalle'),
                                        CommentBox(cModel: combinedModel,),
                                        Expanded(
                                            child: Center(
                                                child: GestureDetector(
                                                    onTap: (){
                                                        print(combinedModel.amount);
                                                    },
                                                    child: const Text('Agregar gasto')
                                                )
                                            )
                                        ),
                                    ],
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}