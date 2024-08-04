import 'package:koda_new_res/screen/koda_manual/training.dart';
import 'package:koda_new_res/screen/loading_screen.dart';
import 'package:koda_new_res/screen/testing.dart';
import 'package:koda_new_res/utils/menu_drawer.dart';
import 'package:koda_new_res/utils/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  static const routeName = '/landing-screen';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
                  'AI-KODA Score Application',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              const Text(
                'Welcome to the AI-KODA Score Application. This application aims to collect medically scored small bowel capsule endoscopy (SBCE) frames from gastroenterologists for the development of automated KODA scoring system using Artificial Intelligence techniques. The application will first teach you how to use the KODA score for assessing the cleanliness of SBCE frames [1]. Then you can take the testing module to score the SBCE frames.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        PageTransition(
                          child: const KodaManual(),
                          type: PageTransitionType.fade,
                        ),
                      );
                    },
                    child: Container(
                      height: getProportionateScreenHeight(80),
                      width: getProportionateScreenWidth(120),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(7),
                        color: const Color.fromRGBO(4, 97, 147, 1),
                      ),
                      child: const Center(
                        child: Text(
                          'Go to Training Module',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(
                          Testing.routeName); //LoadingScreen.routeName
                    },
                    child: Container(
                      height: getProportionateScreenHeight(80),
                      width: getProportionateScreenWidth(120),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(7),
                        color: const Color.fromRGBO(4, 97, 147, 1),
                      ),
                      child: const Center(
                        child: Text(
                          'Go to Testing Module',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(90),
              ),
              const Text(
                '[1] Alageeli, Mohammad, et al. "KODA score: an updated and validated bowel preparation scale for patients undergoing small bowel capsule endoscopy. Endoscopy international open 8.08 (2020): E1011-E1017. (Necessary permission to use KODA score training module has been taken from the corresponding author.)',
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              const Text(
                'Note: All the collected data will be utilized for research purpose only (Ref. No.: IEC-666/05.08.2022).',
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              const Text(
                'Future releases - Real-time deployment to generate computer-aided AI-KODA scored SBCE frames.',
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      drawer: const MenuDrawer(),
    );
  }
}
