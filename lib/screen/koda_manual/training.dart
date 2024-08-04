import 'package:koda_new_res/screen/koda_manual/page2.dart';
import 'package:koda_new_res/utils/menu_drawer.dart';
import 'package:koda_new_res/utils/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class KodaManual extends StatefulWidget {
  const KodaManual({super.key});
  static const routeName = '/koda-manual';

  @override
  State<KodaManual> createState() => _KodaManualState();
}

class _KodaManualState extends State<KodaManual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Training Module'),
        centerTitle: true,
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
                  'KODA Score Training Module',
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
                'Welcome to the KOrea-CanaDA (KODA) score training module. This module will teach you how to use the KODA score for assessing bowel preparation quality during small intestine capsule endoscopy [1].',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              const Text(
                'The KODA score was developed as a means of measuring how clean the small intestine is during the capsule endoscopy procedure. It is based on the following principles:',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              const Text(
                '1. Rather than scoring the entire video, only the first image is selected at regular 5-minute intervals during small bowel transit. These individual images are scored rather than the entire video.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              const Text(
                '2. The cleanliness of the images are based on the % of mucosa (i.e., the walls and folds of the small bowel) visualized and the % that is obstructed (i.e., by bubbles, bile, food etc). A separate score is assigned for each parameter.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(4, 97, 147, 1),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: const Slide2(),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
                  child: const Text('Next'),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              const Text(
                '[1] Alageeli, Mohammad, et al. "KODA score: an updated and validated bowel preparation scale for patients undergoing small bowel capsule endoscopy." Endoscopy international open 8.08 (2020): E1011-E1017.',
              ),
            ],
          ),
        ),
      ),
      drawer: const MenuDrawer(),
    );
  }
}
