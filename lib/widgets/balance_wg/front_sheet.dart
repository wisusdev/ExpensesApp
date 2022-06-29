import 'package:exp_app/utils/constans.dart';
import 'package:flutter/material.dart';

class FrontSheet extends StatelessWidget {
    const FrontSheet({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {

        var list = List.generate(10, (i) => Padding( 
            padding: const EdgeInsets.all(10.0),
            child:Container(
                height:150.0,
                decoration:BoxDecoration(
                    color:Theme.of(context).primaryColorDark,
                    borderRadius:BorderRadius.circular(30.0)
                ),
            ),
        ));

        return Container(
            height: 800.0,
            decoration: Constants.sheetBoxDecoration(
                Theme.of(context).scaffoldBackgroundColor
            ),
            child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: list,
            ),
        );
    }
}