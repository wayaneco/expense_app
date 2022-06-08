import 'package:flutter/material.dart';

import './user_transactions.dart';

class MyHomepage extends StatelessWidget {
  MyHomepage({Key? key}) : super(key: key);

  final appBar = AppBar(
    title: const Text('Expense Planner'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: const UserTransactions(),
    );
  }
}
