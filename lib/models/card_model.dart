import 'dart:convert';

class CardModel {
  final String id;
  final double balance;
  final String cardNumber;
  final String expiryDate;
  final String cardAsset;
  final int leftBgColorVal;
  final int rightBgColorVal;
  final int textColorVal;
  final int accentTextColorVal;

  CardModel({
    required this.id,
    required this.balance,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardAsset,
    required this.leftBgColorVal,
    required this.rightBgColorVal,
    this.textColorVal = 0xFFFFFFFF,
    this.accentTextColorVal = 0xFF161D28,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'balance': balance,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cardAsset': cardAsset,
      'leftBgColorVal': leftBgColorVal,
      'rightBgColorVal': rightBgColorVal,
      'textColorVal': textColorVal,
      'accentTextColorVal': accentTextColorVal,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      id: map['id'] ?? '',
      balance: (map['balance'] as num).toDouble(),
      cardNumber: map['cardNumber'] ?? '',
      expiryDate: map['expiryDate'] ?? '',
      cardAsset: map['cardAsset'] ?? '',
      leftBgColorVal: map['leftBgColorVal'] ?? 0xFF161D28,
      rightBgColorVal: map['rightBgColorVal'] ?? 0xFFDFE94B,
      textColorVal: map['textColorVal'] ?? 0xFFFFFFFF,
      accentTextColorVal: map['accentTextColorVal'] ?? 0xFF161D28,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) => CardModel.fromMap(json.decode(source));
}
