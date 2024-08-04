import 'package:koda_new_res/screen/koda_manual/example_2.dart';
import 'package:koda_new_res/screen/loading_screen.dart';
import 'package:koda_new_res/screen/reference.dart';
import 'package:koda_new_res/utils/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Answer1 extends StatefulWidget {
  static const routeName = '/answer1';

  const Answer1({super.key});

  @override
  State<Answer1> createState() => _Answer1State();
}

class _Answer1State extends State<Answer1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: getProportionateScreenWidth(3),
            ),
            const Text('Answer'),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ReferenceScreen.routeName);
                },
                icon: const Icon(Icons.help),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(4, 97, 147, 1),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(30),
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: getProportionateScreenHeight(200),
                child: Image.asset('assets/example1.png'),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            const Text('The correct answer is:'),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            Row(
              children: const [
                Text(
                  '1. % visualizied mucosa is ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '>75%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text(
                  '. We can see the ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Text(
              'entire mucosa. ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Row(
              children: const [
                Text(
                  '2. % of view obstructed is ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '<5%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text(
                  '. There is nothing ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Text(
              'obstructing our view. ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(90),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(4, 97, 147, 1),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageTransition(
                      child: const Example2(),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                child: const Text('Move to Example 2'),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(4, 97, 147, 1),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoadingScreen.routeName);
                },
                child: const Text('Move to testing module'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
