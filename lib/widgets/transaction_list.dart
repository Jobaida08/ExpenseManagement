import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _allTransactions;
  final Function _deleteTransaction;

  TransactionList(this._allTransactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return _allTransactions.isEmpty
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("It's lonely out here!"),
          SizedBox(height: 20),
        //  Image.asset("assets/images/waiting.png", fit: BoxFit.contain),
        ],
      )
          : ListView.builder(
        itemCount: _allTransactions.length,
        itemBuilder: (context, index) {
          Transaction txn = _allTransactions[index];
          return ListTile(
            leading: Text('TK${txn.txnAmount}'),
            title: Text(txn.description), // Using description as title
            subtitle: Text(DateFormat('MMMM d, y -').add_jm().format(txn.txnDateTime)),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteTransaction(txn.id), // Using id as txnId
            ),
          );
        },
      );
    });
  }
}
