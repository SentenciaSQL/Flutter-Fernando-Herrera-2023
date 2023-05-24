import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) => setState(() {navDrawerIndex = value;}),
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, hasNotch ? 30 : 20, 16, 10),
          child: Text('Main'),
        ),

        ...MenuItem.appMenuItems
        .sublist(0, 3)
        .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
          )
        ),

        Padding(
          padding:  EdgeInsets.fromLTRB(18, 16, 16, 10),
          child: Divider(),
        )

        
      ]
    );
  }
}