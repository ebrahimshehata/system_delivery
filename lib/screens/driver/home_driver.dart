import 'package:flutter/material.dart';
import 'package:system_delivery/screens/driver/tabs/earning_tab.dart';
import 'package:system_delivery/screens/driver/tabs/home_tab.dart';
import 'package:system_delivery/screens/driver/tabs/profile_tab.dart';
import 'package:system_delivery/screens/driver/tabs/rating_tab.dart';
class DriverHome extends StatefulWidget {
  const DriverHome({Key? key}) : super(key: key);

  @override
  State<DriverHome> createState() => DriverHomeState();
}

class DriverHomeState extends State<DriverHome>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;
  void onTaped(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: TabBarView(
              controller: tabController,
              children: [HomeTab(), EarningTab(), RatingTab(), ProfileTab()]),
          bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.green,
              showUnselectedLabels: true,
              currentIndex: selectedIndex,
              onTap: onTaped,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.money), label: "Earning"),
                BottomNavigationBarItem(icon: Icon(Icons.star), label: "Rating"),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
              ]),
        ));
  }
}
