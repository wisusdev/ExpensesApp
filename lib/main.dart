import 'package:exp_app/pages/add_entries.dart';
import 'package:exp_app/pages/add_expenses.dart';
import 'package:exp_app/pages/home_page.dart';
import 'package:exp_app/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    MultiProvider(
        providers: [
            ChangeNotifierProvider(create: (context) => UIProvider())
        ],
        child: const MyApp()
    )
);

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);
    
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Material App',
            theme: ThemeData.dark().copyWith(
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.grey[900],
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    selectedItemColor: Colors.green
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.green[800],
                    foregroundColor: Colors.white
                ),
                scaffoldBackgroundColor: Colors.grey[900],
                primaryColorDark: Colors.grey[800]
            ),
            initialRoute: 'home',
            routes: {
                'home' : (context) => const HomePage(),
                'addEntries' : (context) => const AddEntries(),
                'addExpenses' :(context) => const AddExpenses(),
            },
        );
    }
}