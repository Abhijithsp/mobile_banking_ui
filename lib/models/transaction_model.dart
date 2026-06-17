import 'dart:convert';
import 'package:flutter/widgets.dart';

class TransactionModel {
  final String id;
  final String name;
  final String date;
  final String amount; // e.g. "-140" or "+100"
  final String? avatar;
  final int? iconCodePoint;
  final String? iconFontFamily;
  final String? iconFontPackage;

  TransactionModel({
    required this.id,
    required this.name,
    required this.date,
    required this.amount,
    this.avatar,
    this.iconCodePoint,
    this.iconFontFamily,
    this.iconFontPackage,
  });

  IconData? get icon {
    if (iconCodePoint == null) return null;
    // ignore: non_const_argument_for_const_parameter
    return IconData(iconCodePoint!, fontFamily: iconFontFamily, fontPackage: iconFontPackage);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'amount': amount,
      'avatar': avatar,
      'iconCodePoint': iconCodePoint,
      'iconFontFamily': iconFontFamily,
      'iconFontPackage': iconFontPackage,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      date: map['date'] ?? '',
      amount: map['amount'] ?? '',
      avatar: map['avatar'],
      iconCodePoint: map['iconCodePoint'],
      iconFontFamily: map['iconFontFamily'],
      iconFontPackage: map['iconFontPackage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) => TransactionModel.fromMap(json.decode(source));
}
