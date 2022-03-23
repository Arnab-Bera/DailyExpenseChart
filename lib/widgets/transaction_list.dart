import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delTx;

  const TransactionList(this.transactions, this.delTx, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 550,
      // child: ListView(
      //   children: transactions.map((tx) {
      //     return Card(
      //         child: Row(
      //       children: <Widget>[
      //         Container(
      //           margin: const EdgeInsets.symmetric(
      //             vertical: 10,
      //             horizontal: 15,
      //           ),
      //           decoration: BoxDecoration(
      //             border: Border.all(
      //               color: Colors.purple,
      //               width: 2,
      //             ),
      //           ),
      //           padding: const EdgeInsets.all(5),
      //           child: Text(
      //             '\$${tx.amount}',
      //             style: const TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 20,
      //                 color: Colors.purple),
      //           ),
      //         ),
      //         Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             Text(
      //               tx.title,
      //               style: const TextStyle(
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //             Text(DateFormat.yMMMMEEEEd().format(tx.date),
      //                 style: const TextStyle(
      //                   fontSize: 14,
      //                   color: Colors.grey,
      //                 ))
      //           ],
      //         )
      //       ],
      //     ));
      //   }).toList(),
      // ),
      child: transactions.isEmpty
          ? LayoutBuilder(builder: ((context, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Transactions Found!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            }))
          : ListView(
              // children: transactions
              //     .map((tx) => TransactionItem(
              //           transaction: tx,
              //           delTx: delTx,
              //         ))
              //     .toList(),
              children: [
                ...transactions
                    .map((tx) => TransactionItem(
                          key: ValueKey(tx.id),
                          transaction: tx,
                          delTx: delTx,
                        ))
                    .toList()
              ],
            ),
      //  ListView.builder(
      //     itemBuilder: (context, index) {
      //       return TransactionItem(
      //         transaction: transactions[index],
      //         delTx: delTx,
      //       );
      //       // return Card(
      //       //   child: Row(
      //       //     children: <Widget>[
      //       //       Container(
      //       //         margin: const EdgeInsets.symmetric(
      //       //           vertical: 10,
      //       //           horizontal: 15,
      //       //         ),
      //       //         decoration: BoxDecoration(
      //       //           border: Border.all(
      //       //             color: Theme.of(context).primaryColor,
      //       //             width: 2,
      //       //           ),
      //       //         ),
      //       //         padding: const EdgeInsets.all(5),
      //       //         child: Text(
      //       //           '\$${transactions[index].amount.toStringAsFixed(2)}',
      //       //           style: TextStyle(
      //       //             fontWeight: FontWeight.bold,
      //       //             fontSize: 20,
      //       //             color: Theme.of(context).primaryColor,
      //       //           ),
      //       //         ),
      //       //       ),
      //       //       Column(
      //       //         mainAxisAlignment: MainAxisAlignment.center,
      //       //         crossAxisAlignment: CrossAxisAlignment.start,
      //       //         children: <Widget>[
      //       //           Text(
      //       //             transactions[index].title,
      //       //             // style: const TextStyle(
      //       //             //   fontSize: 16,
      //       //             //   fontWeight: FontWeight.bold,
      //       //             // ),
      //       //             style: Theme.of(context).textTheme.titleLarge,
      //       //           ),
      //       //           Text(
      //       //             DateFormat.yMMMMEEEEd()
      //       //                 .format(transactions[index].date),
      //       //             // style: const TextStyle(
      //       //             //   fontSize: 14,
      //       //             //   color: Colors.grey,
      //       //             // ),
      //       //             style: Theme.of(context).textTheme.titleSmall,
      //       //           )
      //       //         ],
      //       //       ),
      //       //     ],
      //       //   ),
      //       // );
      //     },
      //     itemCount: transactions.length,
      //   ),
    );
  }
}
