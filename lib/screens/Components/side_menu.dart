import 'package:admin_panel/screens/Components/donators_category.dart';
import 'package:admin_panel/screens/Components/volunteers_category.dart';
import 'package:flutter/material.dart';

import 'admin_profile.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            DrawerListTile(
              title: 'Dashboard',
              icon: Icons.dashboard,
              press: () {},
            ),
            DrawerListTile(
              title: 'Donators',
              icon: Icons.food_bank,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonatorsCategory()),
                );
              },
            ),
            DrawerListTile(
              title: 'Volunteers',
              icon: Icons.people,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VolunteersCategory()),
                );
              },
            ),
            // DrawerListTile(
            //   title: 'Update Profile',
            //   icon: Icons.person,
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => AdminProfile()),
            //     );
            //   },
            // ),
            //DrawerListTile(
            //title: 'Panel Settings',
            //icon: Icons.settings,
            //press: () {},
            //),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white54,
      ),
      onTap: press,
      horizontalTitleGap: 0.0,
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
