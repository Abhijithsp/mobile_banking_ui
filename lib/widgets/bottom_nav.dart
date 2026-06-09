import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:banking_ui/views/account_summery.dart';
import 'package:banking_ui/views/dashboard_screen.dart';
import 'package:banking_ui/views/profile_screen.dart';
import 'package:banking_ui/views/wallet_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;
  
  static final List<Widget> _widgetOptions = <Widget>[
    const DashboardScreen(),
    const WalletScreen(),
    const AccountSummeryScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Styles.whiteColor,
        elevation: 8,
        selectedIndex: selectedIndex,
        onDestinationSelected: _onItemTapped,
        indicatorColor: Styles.yellowColor,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Wallet',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart_rounded),
            label: 'Summary',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
