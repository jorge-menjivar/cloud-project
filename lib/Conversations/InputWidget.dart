import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.attach_file),
                color: Colors.blueGrey,
                onPressed: () {},
              ),
            ),
            color: Colors.white,
          ),

          // Text input
          Flexible(
            child: Container(
              child: TextField(
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),

          // Send Message Button
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () {
                  var message = {
                    'text': textEditingController.text,
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
                color: Colors.white70,
              ),
            ),
            color: Colors.blueGrey,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border:
              new Border(top: new BorderSide(color: Colors.grey, width: 0.5)),
          color: Colors.white),
    );
  }
}
