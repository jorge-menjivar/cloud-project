import 'package:cloud_project/homeScreen.dart';
import 'package:cloud_project/secondPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'conversations.dart';

// login file

// -----------------Firebase-----------------
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Authentication());
}

class Authentication extends StatefulWidget {
  Authentication();

  @override
  AuthenticationState createState() => AuthenticationState();
}

class AuthenticationState extends State<Authentication> {
  AuthenticationState();
  FirebaseAuth _auth = FirebaseAuth.instance;

  User _user;
  bool _loaded = false, _dataReady;
  String _name = '', _from = '', _text = '';
  int _timeEpoch = 0;

  @override
  void initState() {
    super.initState();
    loggedIn();
    // _downloadData();
  }

  void loggedIn() async {
    _auth.authStateChanges().listen((user) {
      _loaded = true;
      _user = user;
      setState(() {});
    });
  }

  // Future<void> _downloadData() async {
  //   await Firebase.initializeApp();
  //   // await FirebaseFirestore.instance
  //   //     .collection('conversations')
  //   //     .doc('convo1')
  //   //     .collection('messages')
  //   //     .doc('msg_1')
  //   //     .get()
  //   //     .then((docSnapshot) {
  //   //   if (!docSnapshot.exists) {
  //   //     print('DOC DOES NOT EXIST');
  //   //   } else {
  //   //     _from = docSnapshot.data()['from'];
  //   //     _text = docSnapshot.data()['text'];
  //   //     _timeEpoch = docSnapshot.data()['time_epoch'];
  //   //     setState(() {});
  //   //   }
  //   // });

  //   FirebaseFirestore.instance
  //       .collection('conversations')
  //       .doc('convo1')
  //       .collection('messages')
  //       .doc('nLG73CODFDimHv62aBo0')
  //       .snapshots()
  //       .listen((docSnapshot) async {
  //     if (docSnapshot.exists) {
  //       _text = docSnapshot.data()['text'];
  //       setState(() {});
  //     }
  //   });

  //   var message = {
  //     'text': msg,
  //     'img': false,
  //     'from': user.uid,
  //     'time_epoch': DateTime.now().millisecondsSinceEpoch,
  //   };

  //   FirebaseFirestore.instance
  //       .collection('conversations')
  //       .doc('convo1')
  //       .collection('messages')
  //       .doc()
  //       .set(message);
  // }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (_user == null) {
        // return MaterialApp(
        //   home: Scaffold(
        //     body: LoginScreen(),
        //   ),
        // );
      }
    }
    return MaterialApp(
      home: Scaffold(
        body: ConvoScreen(),
      ),
    );
  }
}
