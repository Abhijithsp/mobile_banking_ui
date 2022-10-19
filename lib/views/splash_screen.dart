import 'dart:async';

import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:banking_ui/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
        color: Styles.greenColor,
        child: const Center(
          child: Text(
            "BANKING",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white),
          ),
        ),
    ),
  );
}

startTime() async {
  var duration = const Duration(seconds: 4);
  return Timer(duration, navigationPage);
}

void navigationPage() {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const BottomNavigationScreen()),
  );
}
}