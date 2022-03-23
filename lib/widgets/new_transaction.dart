import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import './adaptive_widget.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTx, {Key? key}) : super(key: key) {
    print("Constructor NewTransaction Widget");
  }

  final Function addTx;

  @override
  // State<NewTransaction> createState() => _NewTransactionState();
  _NewTransactionState createState() {
    print("createState NewTransaction Widget");
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  DateTime? _selectedDate;

  _NewTransactionState() {
    print("createState NewTransaction State");
  }

  @override
  void initState() {
    print("initState()");
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print("didUpdateWidget()");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("dispose()");
    super.dispose();
  }

  void _submitData() {
    final eneteredTitle = titleControler.text;
    final eneteredAmount = double.parse(amountControler.text);

    if (eneteredTitle == "" || eneteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      eneteredTitle,
      eneteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                // onChanged: (val) => titleInput = val,
                controller: titleControler,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                // onChanged: (val) => amountInput = val,
                controller: amountControler,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData,
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Choosen!'
                          : 'Picked Date : ${DateFormat.yMd().format(_selectedDate!)}'),
                    ),
                    AdaptiveFlatButton('Choose Date', _presentDatePicker)
                  ],
                ),
              ),
              ElevatedButton(
                child: const Text('Add Transaction'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                    foregroundColor:
                        MaterialStateProperty.all(Theme.of(context).cardColor),
                    shadowColor: MaterialStateProperty.all(Colors.black)),
                // onPressed: () {
                //   addTx(
                //     titleControler.text,
                //     double.parse(amountControler.text),
                //   );
                // },
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
