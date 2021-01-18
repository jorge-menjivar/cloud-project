import 'package:cloud_project/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// login file

// -----------------Firebase-----------------
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

class ConvoScreen extends StatefulWidget {
  @override
  _ConvoScreenState createState() => _ConvoScreenState();
}

class _ConvoScreenState extends State<ConvoScreen> {
  final TextEditingController _inputController = TextEditingController();

  Widget buildTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
              ]),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: _inputController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              hintText: 'type your message...',
              hintStyle: TextStyle(color: Colors.black38),

              // key: _emailFieldKey,
              // controller: _emailController,
              // keyboardType: TextInputType.emailAddress,
              // style: TextStyle(color: Colors.black87),
              // decoration: InputDecoration(
              //   border: InputBorder.none,
              //   contentPadding: EdgeInsets.only(top: 14),
              //   prefixIcon: Icon(Icons.email, color: Color(0xff4b2665)),
              //   hintText: 'Email',
              //   hintStyle: TextStyle(color: Colors.black38),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSendBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          var message = {
            'text': _inputController.text,
            'img': false,
            'from': 'user1',
            'time_epoch': DateTime.now().millisecondsSinceEpoch,
          };

          FirebaseFirestore.instance
              .collection('conversations')
              .doc('convo1')
              .collection('messages')
              .doc()
              .set(message);
        },
        elevation: 5,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          'Send',
          style: TextStyle(
              color: Color(0xff4b2665),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x664b2665),
                      Color(0x994b2665),
                      Color(0xcc4b2665),
                      Color(0xff4b2665),
                    ]),
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Write Message:',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50),
                    buildTextField(),
                    buildSendBtn(),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
