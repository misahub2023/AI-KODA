import 'package:koda_new_res/screen/koda_manual/page14.dart';
import 'package:koda_new_res/utils/menu_drawer.dart';
import 'package:koda_new_res/utils/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Slide13 extends StatefulWidget {
  static const routeName = '/slide13';
  const Slide13({super.key});

  @override
  State<Slide13> createState() => _Slide13State();
}

class _Slide13State extends State<Slide13> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(4, 97, 147, 1),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu,
            ),
          ),
        ),
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(30),
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          children: [
            const Text(
              'Another useful trick is to divide it up by thirds. This may also make it easier to see how much of this view is visible or obstructed.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            Image.asset('assets/picture15.png'),
            SizedBox(
              height: getProportionateScreenHeight(280),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(4, 97, 147, 1),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(4, 97, 147, 1),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: Slide14(),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
                  child: const Text('    Next   '),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
