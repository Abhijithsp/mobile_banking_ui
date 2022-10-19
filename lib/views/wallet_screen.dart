import 'package:banking_ui/utils/constants/assets.dart';
import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Styles.accentColor,
      appBar: AppBar(
        toolbarHeight: 100,
        flexibleSpace:Container(
          child: Text("All Cards"),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          Row(
            children: [
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (c) => const AddCardScreen())),
                child: Container(
                  width: size.width * 0.78,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Styles.accentColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.add, color: Styles.whiteColor, size: 20),
                      const SizedBox(height:10),
                      Text('ADD NEW CARD',
                          style: TextStyle(color:Styles.whiteColor))
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Styles.accentColor,
                child: Icon(Icons.document_scanner_outlined, color: Styles.accentColor),
                radius: 23,
              )
            ],
          ),
          SizedBox(height: 20),
          FittedBox(
            child: SizedBox(
              height: size.height * 0.23,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width * 0.67,
                    padding: const EdgeInsets.fromLTRB(16, 10, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(15)),
                      color: Styles.accentColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(Assets.cardsVisaYellow,
                            width: 60, height: 50, fit: BoxFit.cover),
                        const Text('\₹ 250000.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.white)),
                        Text('CARD NUMBER',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12)),
                        const Text('3829 4820 4629 5025',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.27,
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(15)),
                      color: Styles.yellowColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Styles.greenColor,
                          ),
                          child: const Icon(
                            Icons.swipe_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const Spacer(),
                        const Text('VALID',
                            style: TextStyle(fontSize: 12)),
                        const Text('05/22',
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          FittedBox(
            child: SizedBox(
              height: size.height * 0.23,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width * 0.67,
                    padding: const EdgeInsets.fromLTRB(16, 10, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(15)),
                      color: Styles.accentColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(Assets.cardsVisaYellow,
                            width: 60, height: 50, fit: BoxFit.cover),
                        const Text('\₹ 250000.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.white)),
                        Text('CARD NUMBER',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12)),
                        const Text('3829 4820 4629 5025',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.27,
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(15)),
                      color: Styles.yellowColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Styles.greenColor,
                          ),
                          child: const Icon(
                            Icons.swipe_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const Spacer(),
                        const Text('VALID',
                            style: TextStyle(fontSize: 12)),
                        const Text('05/22',
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          FittedBox(
            child: SizedBox(
              height: size.height * 0.23,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width * 0.67,
                    padding: const EdgeInsets.fromLTRB(16, 10, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(15)),
                      color: Styles.accentColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(Assets.cardsMastercard,
                            width: 60, height: 50, fit: BoxFit.cover),
                        const Text('\₹ 250000.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.white)),
                        Text('CARD NUMBER',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12)),
                        const Text('3233 4440 4629 5225',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.27,
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(15)),
                      color: Styles.yellowColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Styles.greenColor,
                          ),
                          child: const Icon(
                            Icons.swipe_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const Spacer(),
                        const Text('VALID',
                            style: TextStyle(fontSize: 12)),
                        const Text('08/25',
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                  FittedBox(
                    child: SizedBox(
                      height: size.height * 0.23,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: size.width * 0.67,
                            padding: const EdgeInsets.fromLTRB(16, 10, 0, 20),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(15)),
                              color: Styles.accentColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(Assets.cardsPaypal,
                                    width: 60, height: 50, fit: BoxFit.cover),
                                const Text('\₹ 200000.00',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32,
                                        color: Colors.white)),
                                Text('CARD NUMBER',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 12)),
                                const Text('1111 4445 4521 5222',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width * 0.27,
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(15)),
                              color: Styles.yellowColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Styles.greenColor,
                                  ),
                                  child: const Icon(
                                    Icons.swipe_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                const Spacer(),
                                const Text('VALID',
                                    style: TextStyle(fontSize: 12)),
                                const Text('11/25',
                                    style: TextStyle(fontSize: 15)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  FittedBox(
                    child: SizedBox(
                      height: size.height * 0.23,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: size.width * 0.67,
                            padding: const EdgeInsets.fromLTRB(16, 10, 0, 20),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(15)),
                              color: Styles.accentColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(Assets.cardsVisa,
                                    width: 60, height: 50, fit: BoxFit.cover),
                                const Text('\₹ 100000.00',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32,
                                        color: Colors.white)),
                                Text('CARD NUMBER',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 12)),
                                const Text('5555 4444 4021 5002',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width * 0.27,
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(15)),
                              color: Styles.yellowColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Styles.greenColor,
                                  ),
                                  child: const Icon(
                                    Icons.swipe_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                const Spacer(),
                                const Text('VALID',
                                    style: TextStyle(fontSize: 12)),
                                const Text('03/25',
                                    style: TextStyle(fontSize: 15)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
