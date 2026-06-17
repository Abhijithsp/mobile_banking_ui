import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:banking_ui/widgets/bank_card.dart';
import 'package:banking_ui/widgets/viewmodel_provider.dart';
import 'package:banking_ui/widgets/staggered_fade_slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String formatCurrency(double amount) {
    List<String> parts = amount.toStringAsFixed(2).split('.');
    String numStr = parts[0];
    String decimal = parts[1];
    if (numStr.length <= 3) {
      return '₹ $numStr.$decimal';
    }
    String lastThree = numStr.substring(numStr.length - 3);
    String otherNumbers = numStr.substring(0, numStr.length - 3);
    RegExp reg = RegExp(r'(\d+?)(?=(\d{2})+(?!\d))');
    String formattedOthers = otherNumbers.replaceAllMapped(reg, (Match m) => '${m[1]},');
    return '₹ $formattedOthers,$lastThree.$decimal';
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModelProvider.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("My Wallet"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert_rounded, color: Styles.primaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        children: <Widget>[
          // Total Balance display
          StaggeredFadeSlide(
            delayMs: 100,
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Styles.greenColor, const Color(0xFF012C33)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Styles.greenColor.withValues(alpha: 0.15),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Balance Across Cards",
                    style: GoogleFonts.outfit(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatCurrency(viewModel.totalBalance),
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Styles.yellowColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "+3.4%",
                          style: GoogleFonts.outfit(
                            color: Styles.accentColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Actions Row (Add card & Scan)
          StaggeredFadeSlide(
            delayMs: 200,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      boxShadow: [
                        BoxShadow(
                          color: Styles.buttonColor.withValues(alpha: 0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Styles.buttonColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => const AddCardScreen()),
                      ),
                      icon: const Icon(CupertinoIcons.add, size: 20),
                      label: Text(
                        'ADD NEW CARD',
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(27),
                    child: Ink(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        color: Styles.accentColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.qr_code_scanner_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Cards list section header
          StaggeredFadeSlide(
            delayMs: 300,
            child: Text(
              "Cards",
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Styles.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Render cards dynamically
          if (viewModel.cards.isNotEmpty)
            ...viewModel.cards.asMap().entries.map((entry) {
              final index = entry.key;
              final card = entry.value;
              return StaggeredFadeSlide(
                delayMs: 350 + (index * 100),
                slideOffset: 20.0,
                child: BankCard(
                  balance: formatCurrency(card.balance),
                  cardNumber: card.cardNumber,
                  expiryDate: card.expiryDate,
                  cardAsset: card.cardAsset,
                  leftBgColor: Color(card.leftBgColorVal),
                  rightBgColor: Color(card.rightBgColorVal),
                  textColor: Color(card.textColorVal),
                  accentTextColor: Color(card.accentTextColorVal),
                ),
              );
            })
          else
            StaggeredFadeSlide(
              delayMs: 350,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                alignment: Alignment.center,
                child: Text(
                  "No cards saved offline.",
                  style: GoogleFonts.outfit(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
