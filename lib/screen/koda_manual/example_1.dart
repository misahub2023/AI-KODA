import 'package:koda_new_res/screen/koda_manual/ans_1.dart';
import 'package:koda_new_res/screen/landing_pg.dart';
import 'package:koda_new_res/screen/reference.dart';
import 'package:koda_new_res/utils/menu_drawer.dart';
import 'package:koda_new_res/utils/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Example1 extends StatefulWidget {
  static const routeName = '/example1';

  const Example1({super.key});

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  bool sel1 = false;
  bool sel2 = false;
  bool sel3 = false;
  bool sel4 = false;
  bool sel5 = false;
  bool sel6 = false;
  bool sel7 = false;
  bool sel8 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ReferenceScreen.routeName);
            },
            icon: const Icon(Icons.help),
          ),
        ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(30),
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Let\'s go through some examples together:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              const Text(
                'Example 1:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Center(
                child: SizedBox(
                  height: getProportionateScreenHeight(200),
                  child: Image.asset('assets/example1.png'),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              const Center(child: Text('% visualized mucosa')),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel1 = true;
                        sel2 = false;
                        sel3 = false;
                        sel4 = false;
                      });
                    },
                    child: Container(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(110),
                      decoration: BoxDecoration(
                        color: sel1 ? Colors.blue : Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '>75%',
                          style: TextStyle(
                            color: sel1 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel1 = false;
                        sel2 = true;
                        sel3 = false;
                        sel4 = false;
                      });
                    },
                    child: Container(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(110),
                      decoration: BoxDecoration(
                        color: sel2 ? Colors.blue : Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '50%-75%',
                          style: TextStyle(
                            color: sel2 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel1 = false;
                        sel2 = false;
                        sel3 = true;
                        sel4 = false;
                      });
                    },
                    child: Container(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(110),
                      decoration: BoxDecoration(
                        color: sel3 ? Colors.blue : Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '25%-49%',
                          style: TextStyle(
                            color: sel3 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel1 = false;
                        sel2 = false;
                        sel3 = false;
                        sel4 = true;
                      });
                    },
                    child: Container(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(110),
                      decoration: BoxDecoration(
                        color: sel4 ? Colors.blue : Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '<25%',
                          style: TextStyle(
                            color: sel4 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),

              //second question
              const Center(child: Text('% of view obstructed')),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel5 = true;
                        sel6 = false;
                        sel7 = false;
                        sel8 = false;
                      });
                    },
                    child: Container(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(110),
                      decoration: BoxDecoration(
                        color: sel5 ? Colors.blue : Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '<5%',
                          style: TextStyle(
                            color: sel5 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel5 = false;
                        sel6 = true;
                        sel7 = false;
                        sel8 = false;
                      });
                    },
                    child: Container(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(110),
                      decoration: BoxDecoration(
                        color: sel6 ? Colors.blue : Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '5%-25%',
                          style: TextStyle(
                            color: sel6 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel5 = false;
                        sel6 = false;
                        sel7 = true;
                        sel8 = false;
                      });
                    },
                    child: Container(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(110),
                      decoration: BoxDecoration(
                        color: sel7 ? Colors.blue : Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(8),
                        ),
                        child: Center(
                          child: Text(
                            '26%-50%',
                            style: TextStyle(
                              color: sel7 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel5 = false;
                        sel6 = false;
                        sel7 = false;
                        sel8 = true;
                      });
                    },
                    child: Container(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(110),
                      decoration: BoxDecoration(
                        color: sel8 ? Colors.blue : Colors.transparent,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '>50%',
                          style: TextStyle(
                            color: sel8 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(25),
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
                      Navigator.of(context)
                          .pushReplacementNamed(LandingPage.routeName);
                    },
                    child: const Text('Exit'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(4, 97, 147, 1),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                          child: const Answer1(),
                          type: PageTransitionType.fade,
                        ),
                      );
                    },
                    child: const Text('Answer'),
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
