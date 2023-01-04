// ignore_for_file: public_member_api_docs, sort_constructors_first, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({required this.addTx});
  final Function addTx;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
                contentPadding: EdgeInsets.only(left: 10),
                // enabledBorder: OutlineInputBorder(
                //   borderSide: const BorderSide(
                //       width: 2, color: Colors.white), //<-- SEE HERE
                //   borderRadius: BorderRadius.circular(50.0),
                // ),
              ),
              controller: _titleController,
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
                contentPadding: EdgeInsets.only(left: 10),
                // enabledBorder: OutlineInputBorder(
                //   borderSide: const BorderSide(
                //       width: 2, color: Colors.white), //<-- SEE HERE
                //   borderRadius: BorderRadius.circular(50.0),
                // ),
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : (DateFormat.yMd().format(_selectedDate!) as String),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: _presentDatePicker,
                      child: const Text(
                        'Choose Date',
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text(
                'Add Transaction',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Quicksans',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
