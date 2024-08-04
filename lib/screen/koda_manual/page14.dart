import 'package:koda_new_res/screen/koda_manual/example_1.dart';
import 'package:koda_new_res/utils/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/menu_drawer.dart';

class Slide14 extends StatelessWidget {
  static const routeName = '/Page14';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Reference Sheet'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(30),
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'KODA SCORE REFERENCE SHEET',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Image.asset('assets/page6img.png'),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              const Text(
                '“We care only about the amount of mucosa visualized. Thus, shadows are penalized.”',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Image.asset('assets/page11img.png'),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              const Text(
                '“We care only about the obstructed view. Thus, shadows are not penalized.”',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
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
                          child: const Example1(),
                          type: PageTransitionType.fade,
                        ),
                      );
                    },
                    child: const Text('Move to Example 1'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
