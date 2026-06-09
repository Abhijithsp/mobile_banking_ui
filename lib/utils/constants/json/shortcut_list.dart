import 'package:banking_ui/views/wallet_screen.dart';
import 'package:flutter/material.dart';

List shortcutList = [
  {
    'color': const Color(0xFF026EF4),
    'icon': Icons.arrow_upward_rounded,
    'label': 'Deposit',
  },
  {
    'color': const Color(0xFFFB6A4B),
    'icon': Icons.send_rounded,
    'route': const WalletScreen(),
    'label': 'Send',
  },
  {
    'color': const Color(0xFF2BB33A),
    'icon': Icons.account_balance_wallet_rounded,
    'label': 'Pay',
  },
  {
    'color': const Color(0xFF024751),
    'icon': Icons.grid_view_rounded,
    'label': 'More',
  },
];

List profilesShortcutList = [
  {
    'color': const Color(0xFFe2a935),
    'icon': Icons.bar_chart_rounded,
    'label': 'Analytics',
  },
  {
    'color': const Color(0xFF2290b8),
    'icon': Icons.notifications_active_rounded,
    'label': 'Alerts',
  },
  {
    'color': const Color(0xFF6bcde8),
    'icon': Icons.settings_rounded,
    'label': 'Settings',
  },
  {
    'color': const Color(0xFF6b41dc),
    'icon': Icons.logout_rounded,
    'label': 'Log Out',
  },
];
