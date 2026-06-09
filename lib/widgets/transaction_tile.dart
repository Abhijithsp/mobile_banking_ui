import 'package:flutter/material.dart';
import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionTile extends StatelessWidget {
  final String name;
  final String date;
  final String amount;
  final String? avatar;
  final IconData? icon;
  final VoidCallback? onTap;

  const TransactionTile({
    super.key,
    required this.name,
    required this.date,
    required this.amount,
    this.avatar,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isNegative = amount.startsWith('-');
    final cleanedAmount = amount.replaceAll('+', '').replaceAll('-', '');
    final formattedAmount = isNegative ? '-\$ $cleanedAmount' : '+\$ $cleanedAmount';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: Styles.whiteColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                // Avatar/Icon Container
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isNegative
                        ? const Color(0xFFFFF1F2) // soft red
                        : const Color(0xFFF0FDF4), // soft green
                    shape: BoxShape.circle,
                  ),
                  child: avatar != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            avatar!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.person_rounded,
                              color: isNegative ? const Color(0xFFF43F5E) : const Color(0xFF22C55E),
                            ),
                          ),
                        )
                      : Center(
                          child: Icon(
                            icon ?? Icons.swap_horiz_rounded,
                            color: isNegative ? const Color(0xFFF43F5E) : const Color(0xFF22C55E),
                            size: 22,
                          ),
                        ),
                ),
                const SizedBox(width: 14),
                // Text details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Styles.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        date,
                        style: GoogleFonts.outfit(
                          color: Colors.grey.shade500,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                // Amount
                Text(
                  formattedAmount,
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isNegative ? const Color(0xFFF43F5E) : const Color(0xFF22C55E),
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
