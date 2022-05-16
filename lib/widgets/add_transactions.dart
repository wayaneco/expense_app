import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTransaction extends StatefulWidget {
  final addNewTransaction;
  const AddTransaction({Key? key, this.addNewTransaction}) : super(key: key);

  @override
  _AddTransaction createState() => _AddTransaction();
}

class _AddTransaction extends State<AddTransaction> {
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

  @override
  void dispose() {
    titleInput.dispose();
    amountInput.dispose();
    super.dispose();
  }

  void submitData() {
    final enteredData = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if (enteredData.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addNewTransaction(enteredData, enteredAmount);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 280,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: titleInput,
              decoration: const InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => submitData(),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: amountInput,
                  decoration: const InputDecoration(
                      labelText: 'Amount', prefixText: '₱'),
                  onSubmitted: (_) => submitData(),
                )),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: submitData, child: const Text('ADD TRANSACTION')),
            )
          ]),
        ));
  }
}
