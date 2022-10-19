import 'package:banking_ui/views/wallet_screen.dart';
import 'package:flutter/material.dart';


List shortcutList = [
  {
    'color': const Color(0xFF026EF4),
    'icon': Icons.arrow_drop_down_circle_sharp,
  },
  {
    'color': const Color(0xFFFB6A4B),
    'icon': Icons.send,
    'route': const WalletScreen(),
  },
  {
    'color': const Color(0xFF2BB33A),
    'icon': Icons.account_balance_wallet,
  },
  {
    'color': const Color(0xFF024751),
    'icon': Icons.category_rounded,
  },

];

List profilesShortcutList = [
  {
    'color': const Color(0xFFe2a935),
    'icon': Icons.bar_chart,
  },
  {
    'color': const Color(0xFF2290b8),
    'icon': Icons.notifications_active,
  },
  {
    'color': const Color(0xFF6bcde8),
    'icon': Icons.settings,
  },
  {
    'color': const Color(0xFF6b41dc),
    'icon': Icons.logout,
  },
];
