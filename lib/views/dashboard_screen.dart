import 'package:banking_ui/utils/constants/assets.dart';
import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:banking_ui/utils/constants/json/shortcut_list.dart';
import 'package:banking_ui/utils/constants/json/transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 260.0,
            backgroundColor: Styles.greenColor,
            pinned: false,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: 'Hi ABHIJITH \nLets Explore!',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Styles.whiteColor),
                            ),
                          ),
                          Icon(
                            Icons.notifications_outlined,
                            size: 28,
                            color: Styles.whiteColor,
                          ),
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
                  ],
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: PersistentHeader(
              widget: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Container(
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Styles.whiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: shortcutList.map<Widget>((item) {
                      return InkWell(
                        onTap: () => item['route'] == null
                            ? null
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => item['route'])),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: item['color'].withOpacity(0.5),
                          ),
                          child: Icon(item['icon'], color: item['color']),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Transactions',
                        style: TextStyle(
                            color: Styles.accentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text('Today',
                            style: TextStyle(
                                color: Styles.accentColor, fontSize: 16)),
                        Icon(CupertinoIcons.chevron_down,
                            color: Styles.accentColor, size: 17)
                      ],
                    )
                  ],
                );
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final trs = transactions[index];
                return ListTile(
                  isThreeLine: true,
                  minLeadingWidth: 20,
                  minVerticalPadding: 20,
                  contentPadding: const EdgeInsets.all(0),
                  leading: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Styles.accentColor,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              color: Colors.white.withOpacity(0.1),
                              blurRadius: 2,
                              spreadRadius: 1,
                            )
                          ],
                          image: index == 0
                              ? null
                              : DecorationImage(
                                  image: AssetImage(trs['avatar']),
                                  fit: BoxFit.cover,
                                ),
                          shape: BoxShape.circle,
                        ),
                        child: index == 0
                            ? Icon(trs['icon'],
                                color: const Color(0xFFFF736C), size: 20)
                            : const SizedBox()),
                  ),
                  title: Text(trs['name'],
                      style: TextStyle(
                          color: Styles.accentColor,
                          fontWeight: FontWeight.w500)),
                  subtitle: Text(trs['date'],
                      style: TextStyle(color: Styles.accentColor)),
                  trailing: Text(trs['amount'],
                      style:
                          const TextStyle(fontSize: 17, color: Colors.white)),
                );
              },
              childCount: transactions.length,
            ),
          ),
        ]),
      ),
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  PersistentHeader({required this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: 150.0,
      color: Styles.accentColor,
      child: Center(child: widget),
    );
  }

  @override
  double get maxExtent => 90.0;

  @override
  double get minExtent => 90.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class PersistentHeaderTransactions extends SliverPersistentHeaderDelegate {
  final Widget widget;

  PersistentHeaderTransactions({required this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: 150.0,
      color: Styles.accentColor,
      child: Center(child: widget),
    );
  }

  @override
  double get maxExtent => 90.0;

  @override
  double get minExtent => 90.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
