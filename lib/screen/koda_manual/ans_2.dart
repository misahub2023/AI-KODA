import 'package:koda_new_res/screen/koda_manual/example_3.dart';
import 'package:koda_new_res/screen/loading_screen.dart';
import 'package:koda_new_res/screen/reference.dart';
import 'package:koda_new_res/utils/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Answer2 extends StatefulWidget {
  static const routeName = '/answer2';

  const Answer2({super.key});

  @override
  State<Answer2> createState() => _Answer2State();
}

class _Answer2State extends State<Answer2> {
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
                child: Image.asset('assets/example2.png'),
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
                  '50-75%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text(
                  '. If you divide up the ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Text(
              'screen into thirds (ie. like a Mercedes symbol), you can see that ~2/3 of the mucosa is visualized.',
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
                  '26-50%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text(
                  '. If you divide up the ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Text(
              'screen into thirds (ie. like a Mercedes symbol), you can see that ~1/3 of the screen is obstructed. ',
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
                      child: const Example3(),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                child: const Text('Move to Example 3'),
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
