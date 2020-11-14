import 'package:flutter/material.dart';
import '../authenticate/sign_in.dart';
import 'medicine_page.dart';
import 'package:nightingale_v1/screens/home/navbar_item.dart';
import 'package:nightingale_v1/screens/home/navbar.dart';
import 'package:nightingale_v1/screens/home/home.dart';
import 'package:nightingale_v1/screens/schedule/schedule.dart';

class RouterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RouterState();
}

class RouterState extends State<RouterScreen> {
  // this is static property so other widget throughout the app
  // can access it simply by AppState.currentTab
  static int currentTab = 0;

  // list tabs here
  final List<TabItem> tabs = [
    TabItem(
      tabName: "Home",
      icon: Icons.home,
      page: HomeScreen(),
    ),
    TabItem(
      tabName: "Medicine",
      icon: Icons.medical_services,
      page: MedicineScreen(),
    ),
    TabItem(
      tabName: "Schedule",
      icon: Icons.calendar_today_outlined,
      page: ScheduleScreen(),
    ),
  ];

  RouterState() {
    // indexing is necessary for proper functionality
    // of determining which tab is active
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
  }

  // sets current tab index
  // and update state
  void _selectTab(int index) {
    if (index == currentTab) {
      // pop to first route
      // if the user taps on the active tab
      tabs[index].key.currentState.popUntil((route) => route.isFirst);
    } else {
      // update the state
      // in order to repaint
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope handle android back btn
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await tabs[currentTab].key.currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (currentTab != 0) {
            // select 'main' tab
            _selectTab(0);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        // indexed stack shows only one child
        body: IndexedStack(
          index: currentTab,
          children: tabs.map((e) => e.page).toList(),
        ),
        // Bottom navigation
        bottomNavigationBar: BottomNavigation(
          onSelectTab: _selectTab,
          tabs: tabs,
        ),
      ),
    );
  }
}