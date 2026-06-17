import 'package:flutter/material.dart';
import 'package:banking_ui/models/card_model.dart';
import 'package:banking_ui/models/transaction_model.dart';
import 'package:banking_ui/services/storage_service.dart';

class BankViewModel extends ChangeNotifier {
  final StorageService _storageService;

  List<CardModel> _cards = [];
  List<TransactionModel> _transactions = [];
  bool _isLoading = false;

  // ignore: prefer_initializing_formals
  BankViewModel({required StorageService storageService}) : _storageService = storageService {
    _loadData();
  }

  List<CardModel> get cards => _cards;
  List<TransactionModel> get transactions => _transactions;
  bool get isLoading => _isLoading;

  // Total balance computed across all cards
  double get totalBalance {
    return _cards.fold(0.0, (sum, card) => sum + card.balance);
  }

  // Load cards and transactions from StorageService
  void _loadData() {
    _isLoading = true;
    notifyListeners();

    _cards = _storageService.getCards();
    _transactions = _storageService.getTransactions();

    _isLoading = false;
    notifyListeners();
  }

  // Add a new card offline
  Future<void> addCard(CardModel newCard) async {
    _cards.insert(0, newCard); // Add new card at the top
    await _storageService.saveCards(_cards);
    notifyListeners();
  }

  // Record a transaction and update the balance of a specific card
  Future<bool> sendMoney({
    required String contactName,
    required String? contactAvatar,
    required double amount,
    required String cardId,
  }) async {
    // 1. Find the card to deduct balance
    final cardIndex = _cards.indexWhere((c) => c.id == cardId);
    if (cardIndex == -1) return false;
    
    final card = _cards[cardIndex];
    if (card.balance < amount) return false; // Insufficient balance

    // 2. Create updated card with deducted balance
    final updatedCard = CardModel(
      id: card.id,
      balance: card.balance - amount,
      cardNumber: card.cardNumber,
      expiryDate: card.expiryDate,
      cardAsset: card.cardAsset,
      leftBgColorVal: card.leftBgColorVal,
      rightBgColorVal: card.rightBgColorVal,
      textColorVal: card.textColorVal,
      accentTextColorVal: card.accentTextColorVal,
    );

    _cards[cardIndex] = updatedCard;

    // 3. Create a transaction record
    final now = DateTime.now();
    final String timeStr = _formatTime(now);

    final newTx = TransactionModel(
      id: 'tx_${DateTime.now().millisecondsSinceEpoch}',
      name: contactName,
      date: timeStr,
      amount: '-$amount',
      avatar: contactAvatar,
    );

    _transactions.insert(0, newTx);

    // 4. Save both to storage
    await _storageService.saveCards(_cards);
    await _storageService.saveTransactions(_transactions);
    
    notifyListeners();
    return true;
  }

  // Deposit money into a specific card
  Future<bool> depositMoney({
    required String cardId,
    required double amount,
  }) async {
    final cardIndex = _cards.indexWhere((c) => c.id == cardId);
    if (cardIndex == -1) return false;

    final card = _cards[cardIndex];

    final updatedCard = CardModel(
      id: card.id,
      balance: card.balance + amount,
      cardNumber: card.cardNumber,
      expiryDate: card.expiryDate,
      cardAsset: card.cardAsset,
      leftBgColorVal: card.leftBgColorVal,
      rightBgColorVal: card.rightBgColorVal,
      textColorVal: card.textColorVal,
      accentTextColorVal: card.accentTextColorVal,
    );

    _cards[cardIndex] = updatedCard;

    final now = DateTime.now();
    final String timeStr = _formatTime(now);

    final newTx = TransactionModel(
      id: 'tx_${DateTime.now().millisecondsSinceEpoch}',
      name: 'DEPOSIT',
      date: timeStr,
      amount: '+$amount',
      iconName: 'deposit',
    );

    _transactions.insert(0, newTx);

    await _storageService.saveCards(_cards);
    await _storageService.saveTransactions(_transactions);

    notifyListeners();
    return true;
  }

  // Clear data and re-initialize with seeded defaults
  Future<void> resetData() async {
    await _storageService.clearAll();
    _loadData();
  }

  // Helper to format time as hh:mm AM/PM
  String _formatTime(DateTime dateTime) {
    int hour = dateTime.hour;
    final String ampm = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12;
    hour = hour == 0 ? 12 : hour;
    final String minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute $ampm';
  }
}
