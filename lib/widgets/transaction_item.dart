import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final deleteTransaction;

  const TransactionItem({
    Key? key,
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.deleteTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.1,
      child: ListTile(
        leading: FittedBox(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColorLight,
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                  child: Text('₱${amount.toString()}'),
                ),
              ),
            ),
          ),
        ),
        title: Text('$title'),
        subtitle: Text(DateFormat.yMMMd().format(date)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).primaryColor,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            deleteTransaction(id);
          },
        ),
      ),
    );
  }
}
