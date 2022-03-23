import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.delTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function delTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late Color _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${widget.transaction.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        // leading: Container(
        //   height: 60,
        //   width: 60,
        //   decoration: BoxDecoration(
        //       color: Theme.of(context).primaryColor,
        //       shape: BoxShape.circle),
        //   child: Padding(
        //     padding: const EdgeInsets.all(6),
        //     child: FittedBox(
        //       child: Text(
        //         '\$${transaction.amount}',
        //         style: const TextStyle(color: Colors.white),
        //       ),
        //     ),
        //   ),
        // ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMMEEEEd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                label: const Text('Delete'),
                icon: const Icon(Icons.delete),
                onPressed: () => widget.delTx(widget.transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.delTx(widget.transaction.id),
              ),
      ),
    );
  }
}
