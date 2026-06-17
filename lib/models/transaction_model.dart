import 'dart:convert';
import 'package:flutter/cupertino.dart';

class TransactionModel {
  final String id;
  final String name;
  final String date;
  final String amount; // e.g. "-140" or "+100"
  final String? avatar;
  final String? iconName;

  TransactionModel({
    required this.id,
    required this.name,
    required this.date,
    required this.amount,
    this.avatar,
    this.iconName,
  });

  IconData? get icon {
    if (iconName == 'home') {
      return CupertinoIcons.house_fill;
    }
    if (iconName == 'deposit') {
      return CupertinoIcons.arrow_down_square_fill;
    }
    return null;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'amount': amount,
      'avatar': avatar,
      'iconName': iconName,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      date: map['date'] ?? '',
      amount: map['amount'] ?? '',
      avatar: map['avatar'],
      iconName: map['iconName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) => TransactionModel.fromMap(json.decode(source));
}
