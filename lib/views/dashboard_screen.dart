import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:banking_ui/utils/constants/json/shortcut_list.dart';
import 'package:banking_ui/utils/constants/json/transactions.dart';
import 'package:banking_ui/widgets/bank_card.dart';
import 'package:banking_ui/widgets/shortcut_button.dart';
import 'package:banking_ui/widgets/transaction_tile.dart';
import 'package:banking_ui/utils/constants/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // User greeting and notifications
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
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
                          Container(
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
                      ),
                      // Card preview
                      BankCard(
                        balance: '₹ 2,50,000.00',
                        cardNumber: '3829 4820 4629 5025',
                        expiryDate: '05/22',
                        cardAsset: Assets.cardsVisaYellow,
                        leftBgColor: Styles.accentColor,
                        rightBgColor: Styles.yellowColor,
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

          // Transactions Header
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            sliver: SliverToBoxAdapter(
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

          // Transactions List
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final trs = transactions[index];
                  return TransactionTile(
                    name: trs['name'],
                    date: trs['date'],
                    amount: trs['amount'],
                    avatar: trs['avatar'],
                    icon: trs['icon'],
                  );
                },
                childCount: transactions.length,
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
