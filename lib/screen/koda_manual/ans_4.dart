import 'package:koda_new_res/screen/loading_screen.dart';
import 'package:koda_new_res/screen/reference.dart';
import 'package:koda_new_res/utils/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Answer4 extends StatefulWidget {
  static const routeName = '/answer4';

  const Answer4({super.key});

  @override
  State<Answer4> createState() => _Answer4State();
}

class _Answer4State extends State<Answer4> {
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
                child: Image.asset('assets/example4.png'),
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
                  '. Although the lumen ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Text(
              'is collapsed, we can see all the mucosa.',
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
                  '. Although the lumen is ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Text(
              'collapsed, the only thing obstructing our view are a few air bubbles.',
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
                  Navigator.of(context)
                      .pushReplacementNamed(LoadingScreen.routeName);
                },
                child: const Text('Move to Testing Module'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
