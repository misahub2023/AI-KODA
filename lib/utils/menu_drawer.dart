import 'package:koda_new_res/auth/logout.dart';
import 'package:koda_new_res/screen/koda_manual/training.dart';
import 'package:koda_new_res/screen/landing_pg.dart';
import 'package:koda_new_res/screen/loading_screen.dart';
import 'package:koda_new_res/screen/profile.dart';
import 'package:koda_new_res/utils/size_configs.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(188, 214, 228, 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(45),
        ),
        const Center(
          child: Text(
            'AI-KODA',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
      ],
    );
  }

  buildMenuItems(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: const Text(
            'Home',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(LandingPage.routeName);
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: const Text(
            'KODA Training Manual',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(KodaManual.routeName);
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: const Text(
            'KODA Testing Module',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(LoadingScreen.routeName);
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: const Text(
            'Logout',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Logout.routeName);
          },
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
