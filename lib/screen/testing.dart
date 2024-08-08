import 'dart:async';

import 'package:hive/hive.dart';
import 'package:koda_new_res/models/dataset.dart';
import 'package:koda_new_res/models/profile_details.dart';
import 'package:koda_new_res/screen/landing_pg.dart';
import 'package:koda_new_res/utils/menu_drawer.dart';
import 'package:koda_new_res/screen/reference.dart';
import 'package:koda_new_res/services/firebase_services.dart';
import 'package:koda_new_res/services/sheet.dart';
import 'package:koda_new_res/utils/button.dart';
import 'package:koda_new_res/utils/size_configs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Testing extends StatefulWidget {
  //Testing({super.key, required this.snapshot});
  static const routeName = '/testing';

  // AsyncSnapshot snapshot;

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  Duration duration = const Duration();
  String opt11 = '0';
  String opt12 = '0';
  String opt13 = '0';
  String opt14 = '0';
  String opt21 = '0';
  String opt22 = '0';
  String opt23 = '0';
  String opt24 = '0';
  static var index = 0;
  bool sel1 = false;
  bool sel2 = false;
  bool sel3 = false;
  bool sel4 = false;
  bool sel5 = false;
  bool sel6 = false;
  bool sel7 = false;
  bool sel8 = false;
  Timer? timer;
  bool choices = false;

  List<Image> viewImage = [
    Image.asset('assets/test_images/cleanliness_1.jpg'),
    Image.asset('assets/test_images/cleanliness_2.jpg'),
    Image.asset('assets/test_images/cleanliness_3.jpg'),
    Image.asset('assets/test_images/cleanliness_4.jpg'),
    Image.asset('assets/test_images/cleanliness_5.jpg'),
    // Add more images as needed
  ];

  @override
  void initState() {
    startTimer();
    super.initState();

    isIndex();
  }

  void isIndex() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    index = sp.getInt('index') ?? 0;
    setState(() {});
  }

  void reset() {
    setState(() {
      duration = const Duration();
    });
  }

  void addTimer() {
    const addsec = 1;

    setState(() {
      final sec = duration.inSeconds + addsec;

      duration = Duration(seconds: sec);
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTimer());
  }

  void stopTimer({bool resetTime = true}) {
    if (resetTime) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var len = 5; //widget.snapshot.data.length;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: buildTimer(),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: IconButton(
                    onPressed: () async {
                      Map<String, dynamic> data = {
                        DataSet.imagePath: viewImage[index],
                        DataSet.option11: opt11,
                        DataSet.option12: opt12,
                        DataSet.option13: opt13,
                        DataSet.option14: opt14,
                        DataSet.option21: opt21,
                        DataSet.option22: opt22,
                        DataSet.option23: opt23,
                        DataSet.option24: opt24,
                        DataSet.date: DateTime.now().toString(),
                        DataSet.user:
                            FirebaseAuth.instance.currentUser?.email.toString(),
                      };

                      await DataSheetApi.insert([data], index);

                      //popup for no choice selected
                      if (choices == false) {
                        Fluttertoast.showToast(
                          msg: 'Exited from testing',
                          gravity: ToastGravity.BOTTOM,
                        );
                      }

                      //saving the progress
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();

                      sp.setInt('index', index);
                      print(sp.getInt('index'));

                      //storing
                      FirebaseServices().storeTime(
                          time: duration.toString(), imageIndex: index);

                      Navigator.of(context)
                          .pushReplacementNamed(LandingPage.routeName);
                      stopTimer(resetTime: true);
                    },
                    icon: const Icon(Icons.cancel),
                  ),
                ),
                //number of images done
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    'Frame number : ${(index + 1).toString()}',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: getProportionateScreenHeight(255),
                  width: getProportionateScreenWidth(250),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text("data didn't load"),
                  ),
                  // child: Image.network(
                  //   'http://20.219.195.58/api${viewImage[index].toString()}',
                  // ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const Text('% visualized mucosa'),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        opt11 = '1';
                        opt12 = '0';
                        opt13 = '0';
                        opt14 = '0';
                        sel1 = true;
                        sel2 = false;
                        sel3 = false;
                        sel4 = false;
                        choices = true;
                      },
                    );
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
                      opt11 = '0';
                      opt12 = '1';
                      opt13 = '0';
                      opt14 = '0';
                      sel1 = false;
                      sel2 = true;
                      sel3 = false;
                      sel4 = false;
                      choices = true;
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
                      opt11 = '0';
                      opt12 = '0';
                      opt13 = '1';
                      opt14 = '0';
                      sel1 = false;
                      sel2 = false;
                      sel3 = true;
                      sel4 = false;
                      choices = true;
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
                      opt11 = '0';
                      opt12 = '0';
                      opt13 = '0';
                      opt14 = '1';
                      sel1 = false;
                      sel2 = false;
                      sel3 = false;
                      sel4 = true;
                      choices = true;
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
              height: getProportionateScreenHeight(20),
            ),
            const Text('% of view obstructed'),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      opt21 = '1';
                      opt22 = '0';
                      opt23 = '0';
                      opt24 = '0';
                      sel5 = true;
                      sel6 = false;
                      sel7 = false;
                      sel8 = false;
                      choices = true;
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
                      opt21 = '0';
                      opt22 = '1';
                      opt23 = '0';
                      opt24 = '0';
                      sel5 = false;
                      sel6 = true;
                      sel7 = false;
                      sel8 = false;
                      choices = true;
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
                      opt21 = '0';
                      opt22 = '0';
                      opt23 = '1';
                      opt24 = '0';
                      sel5 = false;
                      sel6 = false;
                      sel7 = true;
                      sel8 = false;
                      choices = true;
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
                      opt21 = '0';
                      opt22 = '0';
                      opt23 = '0';
                      opt24 = '1';
                      sel5 = false;
                      sel6 = false;
                      sel7 = false;
                      sel8 = true;
                      choices = true;
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
              height: getProportionateScreenHeight(20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(5),
                horizontal: getProportionateScreenWidth(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //back button
                  ButtonWidget(
                    index: index,
                    iconData: Icons.arrow_back,
                    onClicked: () {
                      int imgIndex = index;

                      //restarting and stopping the timer
                      stopTimer(resetTime: true);
                      startTimer();

                      //initialising new values
                      setState(() {
                        if (index == 0) {
                          imgIndex = index = len - 1;
                        } else {
                          imgIndex = index--;
                        }
                        opt11 = '0';
                        opt12 = '0';
                        opt13 = '0';
                        opt14 = '0';
                        opt21 = '0';
                        opt22 = '0';
                        opt23 = '0';
                        opt24 = '0';
                        sel1 = false;
                        sel2 = false;
                        sel3 = false;
                        sel4 = false;
                        sel5 = false;
                        sel6 = false;
                        sel7 = false;
                        sel8 = false;
                      });

                      //deleting the time entry
                      FirebaseServices().deleteTime(imageIndex: index);
                    },
                  ),

                  //forward button
                  //The index moves forward and the response gets stored in the excel sheet
                  ButtonWidget(
                    index: index,
                    iconData: Icons.arrow_forward,
                    onClicked: () async {
                      //excel sheet function
                      Map<String, dynamic> data = {
                        DataSet.imagePath: viewImage,
                        DataSet.option11: opt11,
                        DataSet.option12: opt12,
                        DataSet.option13: opt13,
                        DataSet.option14: opt14,
                        DataSet.option21: opt21,
                        DataSet.option22: opt22,
                        DataSet.option23: opt23,
                        DataSet.option24: opt24,
                        DataSet.date: DateTime.now().toString(),
                        DataSet.user:
                            FirebaseAuth.instance.currentUser?.email.toString(),
                      };

                      await DataSheetApi.insert([data], index);

                      //popup for no choice selected
                      if (choices == false) {
                        Fluttertoast.showToast(
                          msg: 'No choice selected',
                          gravity: ToastGravity.BOTTOM,
                        );
                      }

                      //storing
                      FirebaseServices().storeTime(
                          time: duration.toString(), imageIndex: index);

                      //restarting and stopping the timer
                      stopTimer(resetTime: true);
                      startTimer();

                      //initialising new values
                      setState(
                        () {
                          if (index == len - 1) {
                            index = 0;
                          } else {
                            index++;
                          }
                          opt11 = '0';
                          opt12 = '0';
                          opt13 = '0';
                          opt14 = '0';
                          opt21 = '0';
                          opt22 = '0';
                          opt23 = '0';
                          opt24 = '0';
                          sel1 = false;
                          sel2 = false;
                          sel3 = false;
                          sel4 = false;
                          sel5 = false;
                          sel6 = false;
                          sel7 = false;
                          sel8 = false;
                        },
                      );
                      //saving the progress
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();

                      sp.setInt('index', index);
                      print(sp.getInt('index'));
                      FirebaseServices().progress(imageIndex: index);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimer() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final min = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(3),
        ),
        Text('$min:$seconds'),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(ReferenceScreen.routeName);
          },
          icon: const Icon(Icons.help),
        ),
      ],
    );
  }
}
