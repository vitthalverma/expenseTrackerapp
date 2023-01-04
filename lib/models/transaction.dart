// ignore_for_file: public_member_api_docs, sort_constructors_first

class Transaction {
  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
  final String id;
  final String title;
  final double amount;
  final DateTime date;
}
