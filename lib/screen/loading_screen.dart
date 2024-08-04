import 'package:koda_new_res/screen/testing.dart';
import 'package:koda_new_res/services/api.dart';
import 'package:flutter/material.dart';

import '../utils/menu_drawer.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  static const routeName = '/loading-screen';

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: DataImage.fetchImage(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            print(snapshot.data);
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
              drawer: const MenuDrawer(),
              body: const Center(
                child: Text('Data didnt load'),
              ),
            );
            //const Text('Data didnt load');
          } else if (snapshot.hasData) {
            // print(snapshot.data);
            return Testing(
                //snapshot: snapshot,
                );
          } else {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: const Color.fromRGBO(4, 97, 147, 1),
                automaticallyImplyLeading: false,
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
