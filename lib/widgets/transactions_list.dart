// ignore_for_file: public_member_api_docs, sort_constructors_first, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, this.deleteTx);

  final List<Transaction> transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                const Text(
                  'No Transactions added yet',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 5,
                    ),
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 6, bottom: 6),
                            // decoration: BoxDecoration(
                            //     border: Border.all(width: 3, color: Colors.purple)),
                            margin: const EdgeInsets.all(15),
                            child: Text(
                              '₹${transactions[index].amount}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transactions[index].title,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                DateFormat.yMMMEd()
                                    .format(transactions[index].date),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20),
                            margin: const EdgeInsets.only(left: 130),
                            child: IconButton(
                              onPressed: () => deleteTx(transactions[index].id),
                              icon: const Icon(Icons.delete),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
