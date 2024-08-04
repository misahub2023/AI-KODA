import 'package:koda_new_res/utils/size_configs.dart';
import 'package:flutter/material.dart';

class ReferenceScreen extends StatelessWidget {
  static const routeName = '/reference';
  const ReferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Reference Sheet'),
        backgroundColor: const Color.fromRGBO(4, 97, 147, 1),
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
            ],
          ),
        ),
      ),
    );
  }
}
