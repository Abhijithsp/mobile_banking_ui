import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:banking_ui/utils/constants/json/shortcut_list.dart';
import 'package:banking_ui/widgets/bank_card.dart';
import 'package:banking_ui/widgets/shortcut_button.dart';
import 'package:banking_ui/widgets/transaction_tile.dart';
import 'package:banking_ui/widgets/viewmodel_provider.dart';
import 'package:banking_ui/widgets/staggered_fade_slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
    final primaryCard = viewModel.cards.isNotEmpty ? viewModel.cards.first : null;
    final recentTransactions = viewModel.transactions.take(5).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: CustomScrollView(
        slivers: <Widget>[
          // Header / App Bar section
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 330.0,
            backgroundColor: Styles.greenColor,
            pinned: true,
            titleSpacing: 16.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
            title: Text(
              "APEX BANK",
              style: GoogleFonts.outfit(
                color: Styles.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 2.0,
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    size: 26,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Styles.greenColor, const Color(0xFF012C33)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 75, 16, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // User greeting
                      StaggeredFadeSlide(
                        delayMs: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome back,',
                              style: GoogleFonts.outfit(
                                fontSize: 14,
                                color: Colors.white.withValues(alpha: 0.6),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Abhijith S P',
                              style: GoogleFonts.outfit(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Styles.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Card preview
                      StaggeredFadeSlide(
                        delayMs: 250,
                        child: primaryCard != null
                            ? BankCard(
                                balance: formatCurrency(primaryCard.balance),
                                cardNumber: primaryCard.cardNumber,
                                expiryDate: primaryCard.expiryDate,
                                cardAsset: primaryCard.cardAsset,
                                leftBgColor: Color(primaryCard.leftBgColorVal),
                                rightBgColor: Color(primaryCard.rightBgColorVal),
                                margin: EdgeInsets.zero,
                              )
                            : Container(
                                height: 170,
                                margin: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "No cards active",
                                  style: GoogleFonts.outfit(color: Colors.white),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Shortcut Actions floating strip
          SliverPersistentHeader(
            pinned: true,
            delegate: PersistentHeader(
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: StaggeredFadeSlide(
                  delayMs: 350,
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Styles.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: shortcutList.map<Widget>((item) {
                        return ShortcutButton(
                          icon: item['icon'],
                          label: item['label'],
                          color: item['color'],
                          onTap: () {
                            if (item['route'] != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (c) => item['route']),
                              );
                            }
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Transactions Header
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            sliver: SliverToBoxAdapter(
              child: StaggeredFadeSlide(
                delayMs: 450,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Transactions',
                      style: GoogleFonts.outfit(
                        color: Styles.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        child: Row(
                          children: [
                            Text(
                              'Today',
                              style: GoogleFonts.outfit(
                                color: Styles.greenColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              CupertinoIcons.chevron_down,
                              color: Styles.greenColor,
                              size: 14,
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

          // Transactions List
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final trs = recentTransactions[index];
                  return StaggeredFadeSlide(
                    delayMs: 500 + (index * 80),
                    slideOffset: 15.0,
                    child: TransactionTile(
                      name: trs.name,
                      date: trs.date,
                      amount: trs.amount,
                      avatar: trs.avatar,
                      icon: trs.icon,
                    ),
                  );
                },
                childCount: recentTransactions.length,
              ),
            ),
          ),
          
          // Spacer at the bottom
          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
        ],
      ),
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  PersistentHeader({required this.widget});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: 110.0,
      color: const Color(0xFFF8FAFC),
      child: Center(child: widget),
    );
  }

  @override
  double get maxExtent => 110.0;

  @override
  double get minExtent => 110.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
