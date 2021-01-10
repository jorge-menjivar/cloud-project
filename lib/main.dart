import 'package:cloud_project/home_page.dart';
import 'package:cloud_project/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// -----------------Firebase-----------------
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    _downloadData();
  }

  void loggedIn() async {
    _auth.authStateChanges().listen((user) {
      _loaded = true;
      _user = user;
      setState(() {});
    });
  }

  Future<void> _downloadData() async {
    await Firebase.initializeApp();
    // await FirebaseFirestore.instance
    //     .collection('conversations')
    //     .doc('convo1')
    //     .collection('messages')
    //     .doc('msg_1')
    //     .get()
    //     .then((docSnapshot) {
    //   if (!docSnapshot.exists) {
    //     print('DOC DOES NOT EXIST');
    //   } else {
    //     _from = docSnapshot.data()['from'];
    //     _text = docSnapshot.data()['text'];
    //     _timeEpoch = docSnapshot.data()['time_epoch'];
    //     setState(() {});
    //   }
    // });

    FirebaseFirestore.instance
        .collection('conversations')
        .doc('convo1')
        .collection('messages')
        .doc('nLG73CODFDimHv62aBo0')
        .snapshots()
        .listen((docSnapshot) async {
      if (docSnapshot.exists) {
        _text = docSnapshot.data()['text'];
        setState(() {});
      }
    });

    // var message = {
    //   'text': msg,
    //   'img': false,
    //   'from': user.uid,
    //   'time_epoch': DateTime.now().millisecondsSinceEpoch,
    // };

    // FirebaseFirestore.instance
    //     .collection('conversations')
    //     .doc('convo1')
    //     .collection('messages')
    //     .doc()
    //     .set(message);
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return MaterialApp(
        theme: lightTheme(),
        darkTheme: darkTheme(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Cloud Project'),
          ),
          body: (_user == null) ? LoginPage() : HomePage(),
        ),
      );
    }
  }

  ThemeData lightTheme() {
    // Feel free to change
    // This is the light theme for the app.
    // All colors and other UI cuztomizations should be done here.
    return ThemeData(
      primaryColor: Colors.green,
      primarySwatch: Colors.blueGrey,
      canvasColor: Colors.white,
      accentColor: Colors.blueAccent,
      dividerColor: Colors.black12,
      primaryColorBrightness: Brightness.light,
      brightness: Brightness.light,
      accentColorBrightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 1,
        shadowColor: Colors.black,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          primaryColor: Colors.black87,
        ),
        primaryColor: Colors.red,
        primaryContrastingColor: Colors.black,
        barBackgroundColor: Colors.white,
      ),
    );
  }

  ThemeData darkTheme() {
    // Feel free to change
    // This is the dark theme for the app.
    // All colors and other UI cuztomizations should be done here.
    return ThemeData(
      primaryColor: Colors.green,
      primaryColorLight: Colors.blueGrey,
      primaryColorDark: Colors.white38,
      primarySwatch: Colors.blueGrey,
      canvasColor: Colors.black,
      accentColor: Colors.blueAccent,
      dividerColor: Colors.white30,
      primaryColorBrightness: Brightness.dark,
      brightness: Brightness.dark,
      accentColorBrightness: Brightness.light,
      iconTheme: IconThemeData(
        color: Colors.white,
        opacity: 1,
        size: 25,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.black,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          primaryColor: Colors.white,
        ),
        primaryColor: Colors.red,
        primaryContrastingColor: Colors.white,
        barBackgroundColor: Colors.black,
      ),
    );
  }
}
