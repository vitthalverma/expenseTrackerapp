// ignore_for_file: public_member_api_docs, sort_constructors_first, sized_box_for_whitespace
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
    this.lable,
    this.spendingAmount,
    this.spendingPctOfTotal,
  );
  final String lable;
  final double spendingAmount;
  final double spendingPctOfTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 20,
            child: FittedBox(
                child: Text('₹${spendingAmount.toStringAsFixed(0)}'))),
        const SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                color: const Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendingPctOfTotal,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ]),
        ),
        const SizedBox(height: 4),
        Text(lable),
      ],
    );
  }
}
