import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:banking_ui/views/account_summery.dart';
import 'package:banking_ui/views/dashboard_screen.dart';
import 'package:banking_ui/views/profile_screen.dart';
import 'package:banking_ui/views/wallet_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex=0;
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
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Styles.whiteColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontSize: 20, color: Styles.primaryColor),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Styles.accentColor,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded,size: 30,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet,size: 30),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard,size: 30),
            label: 'Summery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp,size: 30),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
