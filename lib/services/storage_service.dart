import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:banking_ui/models/card_model.dart';
import 'package:banking_ui/models/transaction_model.dart';
import 'package:banking_ui/utils/constants/assets.dart';
import 'package:flutter/cupertino.dart';

class StorageService {
  static const String _cardsKey = 'user_cards';
  static const String _transactionsKey = 'user_transactions';

  final SharedPreferences _prefs;

  StorageService(this._prefs);

  static Future<StorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  // Get saved cards (or return seeded cards if empty)
  List<CardModel> getCards() {
    final String? cardsJson = _prefs.getString(_cardsKey);
    if (cardsJson == null || cardsJson.isEmpty) {
      // Seed default cards
      final defaultCards = _getSeedCards();
      saveCards(defaultCards);
      return defaultCards;
    }
    try {
      final List<dynamic> decoded = json.decode(cardsJson);
      return decoded.map((item) => CardModel.fromMap(item)).toList();
    } catch (e) {
      debugPrint("Error loading cards: $e");
      return _getSeedCards();
    }
  }

  // Save cards
  Future<bool> saveCards(List<CardModel> cards) async {
    final String cardsJson = json.encode(cards.map((c) => c.toMap()).toList());
    return await _prefs.setString(_cardsKey, cardsJson);
  }

  // Get saved transactions (or return seeded transactions if empty)
  List<TransactionModel> getTransactions() {
    final String? transactionsJson = _prefs.getString(_transactionsKey);
    if (transactionsJson == null || transactionsJson.isEmpty) {
      // Seed default transactions
      final defaultTransactions = _getSeedTransactions();
      saveTransactions(defaultTransactions);
      return defaultTransactions;
    }
    try {
      final List<dynamic> decoded = json.decode(transactionsJson);
      return decoded.map((item) => TransactionModel.fromMap(item)).toList();
    } catch (e) {
      debugPrint("Error loading transactions: $e");
      return _getSeedTransactions();
    }
  }

  // Save transactions
  Future<bool> saveTransactions(List<TransactionModel> transactions) async {
    final String transactionsJson = json.encode(transactions.map((t) => t.toMap()).toList());
    return await _prefs.setString(_transactionsKey, transactionsJson);
  }

  // Seed data generators
  List<CardModel> _getSeedCards() {
    return [
      CardModel(
        id: 'card_1',
        balance: 250000.00,
        cardNumber: '3829 4820 4629 5025',
        expiryDate: '05/22',
        cardAsset: Assets.cardsVisaYellow,
        leftBgColorVal: 0xFF030C10, // Styles.accentColor
        rightBgColorVal: 0xFFDFE94B, // Styles.yellowColor
      ),
      CardModel(
        id: 'card_2',
        balance: 150000.00,
        cardNumber: '3829 4820 4629 5025',
        expiryDate: '05/22',
        cardAsset: Assets.cardsVisaWhite,
        leftBgColorVal: 0xFF1E293B,
        rightBgColorVal: 0xFF94A3B8,
      ),
      CardModel(
        id: 'card_3',
        balance: 300000.00,
        cardNumber: '3233 4440 4629 5225',
        expiryDate: '08/25',
        cardAsset: Assets.cardsMastercard,
        leftBgColorVal: 0xFF7C2D12,
        rightBgColorVal: 0xFFFDBA74,
      ),
    ];
  }

  List<TransactionModel> _getSeedTransactions() {
    return [
      TransactionModel(
        id: 'tx_1',
        name: 'ABHIJITH',
        date: '4:56 PM',
        amount: '-140',
        iconName: 'home',
      ),
      TransactionModel(
        id: 'tx_2',
        name: 'Jhon',
        date: '5:20 PM',
        amount: '+100',
        avatar: Assets.dash,
      ),
      TransactionModel(
        id: 'tx_3',
        name: 'MOHAMMED RIYAS',
        date: '7:21 PM',
        amount: '+150',
        avatar: Assets.memoji1,
      ),
      TransactionModel(
        id: 'tx_4',
        name: 'MOHAMMED SHANI',
        date: '7:45 PM',
        amount: '-110',
        avatar: Assets.memoji2,
      ),
      TransactionModel(
        id: 'tx_5',
        name: 'NIKHIL',
        date: '8:21 PM',
        amount: '+110',
        avatar: Assets.memoji3,
      ),
      TransactionModel(
        id: 'tx_6',
        name: 'AJMAL',
        date: '9:21 PM',
        amount: '+1000',
        avatar: Assets.memoji4,
      ),
      TransactionModel(
        id: 'tx_7',
        name: 'AMMU',
        date: '7:21 PM',
        amount: '+110',
        avatar: Assets.memoji5,
      ),
    ];
  }

  // Helper to clear data (useful for testing or resets)
  Future<void> clearAll() async {
    await _prefs.remove(_cardsKey);
    await _prefs.remove(_transactionsKey);
  }
}
