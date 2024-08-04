import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:koda_new_res/models/profile_details.dart';

class FirebaseServices {
  static User get user => auth.currentUser!;
  //for authentication
  static FirebaseAuth auth = FirebaseAuth.instance;

  final docUser = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser?.email);

  Future createUser(
    String name,
    String affiliation,
    String exp,
    String fieldStudy,
  ) async {
    final json = {
      'name': name,
      'affiliation': affiliation,
      'numbers of capsules read': fieldStudy,
      'experience in this field': exp,
    };

    await docUser.set(json);
  }

  Future updateInfo({
    required String name,
    required String affiliation,
    required String exp,
    required String fieldStudy,
    required BuildContext context,
  }) async {
    try {
      await docUser.update(
        {
          'name': name,
          'affiliation': affiliation,
          'numbers of capsules read': fieldStudy,
          'experience in this field': exp,
        },
      );
      Fluttertoast.showToast(
          msg: "Information updated", gravity: ToastGravity.BOTTOM);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.BOTTOM);
      Navigator.of(context).pop();
    }
  }

  Future storeTime({required String time, required int imageIndex}) async {
    imageIndex += 1;
    final json = {
      'Image index : ${imageIndex.toString()}': {
        'time_taken': time,
      }
    };

    await docUser.update(json);
  }

  Future deleteTime({required int imageIndex}) async {
    imageIndex += 1;
    await docUser.update(
        {'Image index : ${imageIndex.toString()}': FieldValue.delete()});
  }

  Future progress({required int imageIndex}) async {
    await docUser.update({'index': imageIndex});
  }

  static late ProfileDetails details;
  static Future<void> loadIndex() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user.uid)
        .get()
        .then((user) async {
      if (user.exists) {
        details = ProfileDetails.fromJson(user.data()!);
      }
    });
  }
}
