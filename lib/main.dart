import 'package:hive_flutter/hive_flutter.dart';
import 'package:koda_new_res/auth/logout.dart';
import 'package:koda_new_res/auth/main_page.dart';
import 'package:koda_new_res/auth/verify.dart';
import 'package:koda_new_res/firebase_options.dart';
import 'package:koda_new_res/screen/koda_manual/ans_1.dart';
import 'package:koda_new_res/screen/koda_manual/ans_2.dart';
import 'package:koda_new_res/screen/koda_manual/ans_3.dart';
import 'package:koda_new_res/screen/koda_manual/ans_4.dart';
import 'package:koda_new_res/screen/koda_manual/example_1.dart';
import 'package:koda_new_res/screen/koda_manual/example_2.dart';
import 'package:koda_new_res/screen/koda_manual/example_3.dart';
import 'package:koda_new_res/screen/koda_manual/example_4.dart';
import 'package:koda_new_res/screen/koda_manual/page14.dart';
import 'package:koda_new_res/screen/koda_manual/training.dart';
import 'package:koda_new_res/screen/koda_manual/page10.dart';
import 'package:koda_new_res/screen/koda_manual/page11.dart';
import 'package:koda_new_res/screen/koda_manual/page12.dart';
import 'package:koda_new_res/screen/koda_manual/page13.dart';
import 'package:koda_new_res/screen/koda_manual/page2.dart';
import 'package:koda_new_res/screen/koda_manual/page3.dart';
import 'package:koda_new_res/screen/koda_manual/page4.dart';
import 'package:koda_new_res/screen/koda_manual/page5.dart';
import 'package:koda_new_res/screen/koda_manual/page6.dart';
import 'package:koda_new_res/screen/koda_manual/page7.dart';
import 'package:koda_new_res/screen/koda_manual/page8.dart';
import 'package:koda_new_res/screen/koda_manual/page9.dart';
import 'package:koda_new_res/screen/landing_pg.dart';
import 'package:koda_new_res/screen/loading_screen.dart';
import 'package:koda_new_res/screen/profile.dart';
import 'package:koda_new_res/screen/reference.dart';
import 'package:koda_new_res/screen/registration.dart';
import 'package:koda_new_res/screen/testing.dart';
import 'package:koda_new_res/services/sheet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('user_progress');

  await DataSheetApi.init();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(), //LoadingScreen(),
      routes: {
        //Login.routeName:(context) => const Login(showRegisterPage: ),
        MainPage.routeName: (context) => MainPage(),
        LoadingScreen.routeName: (context) => const LoadingScreen(),
        Verification.routeName: (context) => const Verification(),
        Logout.routeName: (context) => const Logout(),
        KodaManual.routeName: (context) => const KodaManual(),
        RegistrationPage.routeName: (context) => const RegistrationPage(),
        LandingPage.routeName: (context) => const LandingPage(),
        ReferenceScreen.routeName: (context) => const ReferenceScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        Testing.routeName: (context) => Testing(),
        Slide2.routeName: (context) => const Slide2(),
        Slide3.routeName: (context) => const Slide3(),
        Slide4.routeName: (context) => const Slide4(),
        Slide5.routeName: (context) => const Slide5(),
        Slide6.routeName: (context) => const Slide6(),
        Slide7.routeName: (context) => const Slide7(),
        Slide8.routeName: (context) => const Slide8(),
        Slide9.routeName: (context) => const Slide9(),
        Slide10.routeName: (context) => const Slide10(),
        Slide11.routeName: (context) => const Slide11(),
        Slide12.routeName: (context) => const Slide12(),
        Slide13.routeName: (context) => const Slide13(),
        Slide14.routeName: (context) => Slide14(),
        Example1.routeName: (context) => const Example1(),
        Example2.routeName: (context) => const Example2(),
        Example3.routeName: (context) => const Example3(),
        Example4.routeName: (context) => const Example4(),
        Answer1.routeName: (context) => const Answer1(),
        Answer2.routeName: (context) => const Answer2(),
        Answer3.routeName: (context) => const Answer3(),
        Answer4.routeName: (context) => const Answer4(),
      },
    );
  }
}
