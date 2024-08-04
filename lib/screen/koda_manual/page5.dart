import 'package:koda_new_res/screen/koda_manual/page6.dart';
import 'package:koda_new_res/utils/menu_drawer.dart';
import 'package:koda_new_res/utils/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Slide5 extends StatefulWidget {
  static const routeName = '/slide5';
  const Slide5({super.key});

  @override
  State<Slide5> createState() => _Slide5State();
}

class _Slide5State extends State<Slide5> {
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
              '% of mucosa visualized ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const Text(
              'It refers to how much of the mucosa you can see. For this part of the score, we only care about how much of the mucosa is seen, regardless of what is causing the obstructed view (i.e., bubbles, debris, food, blood or shadows).',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const Text(
              'Here is Example D:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Image.asset('assets/example_d.png'),
            SizedBox(
              height: getProportionateScreenHeight(70),
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
                        child: const Slide6(),
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
