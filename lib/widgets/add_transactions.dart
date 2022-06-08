import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final addNewTransaction;
  const AddTransaction({Key? key, this.addNewTransaction}) : super(key: key);

  @override
  _AddTransaction createState() => _AddTransaction();
}

class _AddTransaction extends State<AddTransaction> {
  final _formKey = GlobalKey<FormState>();

  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  DateTime? selectedDate;

  Map<String, bool> validatedFields = {
    'titleInputValidate': false,
    'amountInputValidate': false,
    'selectedDateValidate': false
  };

  @override
  void dispose() {
    titleInput.dispose();
    amountInput.dispose();
    super.dispose();
  }

  void submitData() {
    final enteredData = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if (enteredData.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      setState(() {
        validatedFields['titleInputValidate'] =
            enteredData.isEmpty ? true : false;
        validatedFields['amountInputValidate'] =
            enteredAmount <= 0 ? true : false;
        validatedFields['selectedDateValidate'] =
            selectedDate == null ? true : false;
      });
      return;
    }

    widget.addNewTransaction(enteredData, enteredAmount, selectedDate);
    Navigator.pop(context);
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate:
          selectedDate != null ? selectedDate as DateTime : DateTime.now(),
      firstDate: DateTime.now().subtract(
        const Duration(days: 7),
      ),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) => {
        if (pickedDate != null)
          {
            setState(
              () {
                selectedDate = pickedDate;
              },
            )
          },
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: 280,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                controller: titleInput,
                decoration: InputDecoration(
                  labelText: 'Title',
                  errorText: validatedFields['selectedDateValidate'] == true
                      ? "Error"
                      : null,
                ),
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
              const SizedBox(
                height: 7,
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectedDate == null
                            ? 'No Date Chosen'
                            : DateFormat.yMMMd()
                                .format(selectedDate as DateTime),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _presentDatePicker,
                      child: Text('Choose Date'),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitData,
                  child: const Text('ADD TRANSACTION'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
