// To parse this JSON data, do
//
//     final transaction = transactionFromMap(jsonString);

import 'dart:convert';

Transaction transactionFromMap(String str) =>
    Transaction.fromMap(json.decode(str));

String transactionToMap(Transaction data) => json.encode(data.toMap());

class Transaction {
  Transaction({
    this.id,
    this.title,
    this.amount,
    this.date,
    this.category,
  });

  int? id;
  String? title;
  double? amount;
  DateTime? date;
  String? category;

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        title: json["title"],
        amount: json["amount"].toDouble(),
        date: DateTime.parse(json["date"]),
        category: json["category"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "amount": amount,
        "date": date?.toIso8601String(),
        "category": category,
      };
}
