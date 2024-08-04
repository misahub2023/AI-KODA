import 'package:koda_new_res/screen/koda_manual/page8.dart';
import 'package:koda_new_res/utils/menu_drawer.dart';
import 'package:koda_new_res/utils/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Slide7 extends StatefulWidget {
  static const routeName = '/slide7';
  const Slide7({super.key});

  @override
  State<Slide7> createState() => _Slide7State();
}

class _Slide7State extends State<Slide7> {
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
              'Next, let’s turn our attention to the % obstructed view score, the second component of the KODA score. The % obstructed view refers to how much of the view is obstructed by bile, bubbles, blood and debris. It is important to note that shadows do not count towards the % obstructed view score.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const Text(
              'Here is Example E:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Image.asset('assets/example_e.png'),
            SizedBox(
              height: getProportionateScreenHeight(45),
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
                        child: const Slide8(),
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
