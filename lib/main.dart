import 'package:flutter/material.dart';

import './widgets/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expense Planner',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.red,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: Colors.red,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Theme.of(context).primaryColor,
          ),
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
        ),
        home: MyHomepage());
  }
}
