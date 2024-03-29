import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import "package:intl/intl.dart";

class ChatItemWidget extends StatelessWidget {
  var index;
  final String text;
  final int time;
  final String from;

  final String uid = 'user1'; //FirebaseAuth.instance.currentUser.toString();

  ChatItemWidget(this.index, {@required this.text, @required this.time, @required this.from});
  @override
  Widget build(BuildContext context) {
    //implement build
    if (from == uid) {
      //This is the sent message. We'll later use data from firebase instead of index to determine the message is sent or received.
      return Container(
          child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Text(
                text,
                style: TextStyle(color: Colors.black),
              ),
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              width: 200.0,
              decoration: SelfMessageColor(),
              margin: EdgeInsets.only(right: 10.0),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.end, // aligns the chatitem to right end
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Container(
            //make a date/time stamp
            /*child: Text(
              DateFormat('dd MMM kk:mm')
                  .format(DateTime.fromMillisecondsSinceEpoch(1565888474278)),
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                  fontStyle: FontStyle.normal),
            ),*/
            margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
          )
        ])
      ]));
    } else {
      // This is a received message
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  width: 200.0,
                  decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(8.0)),
                  margin: EdgeInsets.only(left: 10.0),
                )
              ],
            ),
            //Make a date/time stamp
            /*Container(
              child: Text(
                DateFormat('dd MMM kk:mm')
                    .format(DateTime.fromMillisecondsSinceEpoch(1565888474278)),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontStyle: FontStyle.normal),
              ),
              margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
            )*/
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        margin: EdgeInsets.only(bottom: 10.0),
      );
    }
  }

  BoxDecoration SelfMessageColor() {
    return BoxDecoration(color: Colors.indigo[200], borderRadius: BorderRadius.circular(8.0));
  }
}
