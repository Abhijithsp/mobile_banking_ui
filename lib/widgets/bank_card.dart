import 'package:flutter/material.dart';
import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class BankCard extends StatelessWidget {
  final String balance;
  final String cardNumber;
  final String expiryDate;
  final String cardAsset;
  final Color leftBgColor;
  final Color rightBgColor;
  final Color textColor;
  final Color accentTextColor;
  final VoidCallback? onTap;

  const BankCard({
    super.key,
    required this.balance,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardAsset,
    this.leftBgColor = const Color(0xFF161D28),
    this.rightBgColor = const Color(0xFFDFE94B),
    this.textColor = Colors.white,
    this.accentTextColor = const Color(0xFF161D28),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Format card number to group in 4s or mask middle digits
    String formattedCardNumber = cardNumber;
    if (cardNumber.replaceAll(' ', '').length >= 16) {
      final clean = cardNumber.replaceAll(' ', '');
      formattedCardNumber = "${clean.substring(0, 4)}  ••••  ••••  ${clean.substring(12)}";
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                // Left side details (70% width)
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                    height: 170,
                    color: leftBgColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              cardAsset,
                              width: 60,
                              height: 40,
                              fit: BoxFit.contain,
                              errorBuilder: (c, e, s) => const Icon(
                                Icons.credit_card,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Container(
                              width: 32,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Colors.amber.withValues(alpha: 0.7),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              balance,
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CARD NUMBER',
                              style: GoogleFonts.outfit(
                                color: textColor.withValues(alpha: 0.5),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.8,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              formattedCardNumber,
                              style: GoogleFonts.outfit(
                                color: textColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Right side action and expiry (30% width)
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(12, 16, 12, 20),
                    height: 170,
                    color: rightBgColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Styles.greenColor.withValues(alpha: 0.15),
                          ),
                          child: Icon(
                            Icons.swipe_vertical_rounded,
                            color: accentTextColor,
                            size: 20,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'VALID',
                              style: GoogleFonts.outfit(
                                color: accentTextColor.withValues(alpha: 0.6),
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              expiryDate,
                              style: GoogleFonts.outfit(
                                color: accentTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
