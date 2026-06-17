import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSummeryScreen extends StatefulWidget {
  const AccountSummeryScreen({super.key});

  @override
  State<AccountSummeryScreen> createState() => _AccountSummeryScreenState();
}

class _AccountSummeryScreenState extends State<AccountSummeryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("Insights"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Monthly Spending Summary Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Styles.whiteColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "This Month Spending",
                      style: GoogleFonts.outfit(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(Icons.trending_up_rounded, color: Styles.blueColor),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "₹ 42,850.00",
                  style: GoogleFonts.outfit(
                    color: Styles.primaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Custom Spending Progress Bar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Monthly Budget Limit",
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Text(
                          "70% Used",
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Styles.greenColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0.7,
                        minHeight: 8,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(Styles.greenColor),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "₹ 17,150.00 remaining of ₹ 60,000.00 limit",
                      style: GoogleFonts.outfit(
                        fontSize: 11,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Categories Title
          Text(
            "Top Categories",
            style: GoogleFonts.outfit(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Styles.primaryColor,
            ),
          ),
          const SizedBox(height: 12),

          // Category Cards Grid/List
          _buildCategoryItem(
            icon: Icons.shopping_bag_rounded,
            color: const Color(0xFF8F99D0),
            name: "Shopping",
            count: "12 Transactions",
            amount: "₹ 18,450.00",
            percent: 43.0,
          ),
          _buildCategoryItem(
            icon: Icons.restaurant_rounded,
            color: const Color(0xFFEC9F9B),
            name: "Food & Dining",
            count: "24 Transactions",
            amount: "₹ 12,120.00",
            percent: 28.0,
          ),
          _buildCategoryItem(
            icon: Icons.directions_car_rounded,
            color: const Color(0xFFDDA8CF),
            name: "Transport",
            count: "18 Transactions",
            amount: "₹ 6,280.00",
            percent: 15.0,
          ),
          _buildCategoryItem(
            icon: Icons.movie_creation_rounded,
            color: const Color(0xFFD6F2CD),
            name: "Entertainment",
            count: "5 Transactions",
            amount: "₹ 4,000.00",
            percent: 9.0,
          ),
          _buildCategoryItem(
            icon: Icons.electrical_services_rounded,
            color: const Color(0xFFECDCC1),
            name: "Utilities",
            count: "3 Transactions",
            amount: "₹ 2,000.00",
            percent: 5.0,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem({
    required IconData icon,
    required Color color,
    required String name,
    required String count,
    required String amount,
    required double percent,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Styles.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.015),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
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
                Text(
                  count,
                  style: GoogleFonts.outfit(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Styles.primaryColor,
                ),
              ),
              Text(
                "${percent.toStringAsFixed(0)}%",
                style: GoogleFonts.outfit(
                  color: Styles.greenColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
