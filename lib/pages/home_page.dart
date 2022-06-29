import 'package:exp_app/pages/balance_page.dart';
import 'package:exp_app/pages/chats_page.dart';
import 'package:flutter/material.dart';

import 'package:exp_app/providers/ui_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/home_wg/custom_navigarion_bar.dart';

class HomePage extends StatelessWidget {
    const HomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return const Scaffold(
            bottomNavigationBar: CustomNavigationBar(),
            body: _HomePage(),
        );
    }
}

class _HomePage extends StatelessWidget {
    const _HomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        final uiProvider = Provider.of<UIProvider>(context);
        final currentIndex = uiProvider.bottomNavigationBarIndex;
        
        switch(currentIndex){
            case 0: 
                return const BalancePage();
            case 1:
                return const ChartsPage();
            default :
                return const BalancePage();
        }
    }
}