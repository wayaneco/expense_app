import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;

  const TransactionItem(
      {Key? key, required this.title, required this.amount, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              Container(
                width: 65,
                margin: const EdgeInsets.only(right: 10),
                child: Text(
                  '₱${amount.toString()}',
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    DateFormat('MMMM d, y h:m a').format(date),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              )),
              IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.red,
                  ))
            ],
          )),
    );
  }
}
