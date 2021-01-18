import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_project/Conversations/ChatAppBar.dart';
import 'package:cloud_project/Conversations/ChatListWidget.dart';
import 'package:cloud_project/Conversations/InputWidget.dart';
import 'package:flutter/material.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  List<QueryDocumentSnapshot> _list;

  @override
  void initState() {
    // TODO: implement initState
    downloadData();
    super.initState();
  }

  Future<void> downloadData() async {
    FirebaseFirestore.instance
        .collection('conversations')
        .doc('convo1')
        .collection('messages')
        .orderBy('time_epoch', descending: true)
        .snapshots()
        .listen((querySnapshots) {
      _list = querySnapshots.docs;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ChatAppBar(), // Custom app bar for chat screen
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                ChatListWidget(
                  querySnapshots: _list,
                ), //Chat list
                InputWidget() // The input widget
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* code written with Jorge

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}
//created state

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversation Screen'),
      ),
      body: ListView.builder(
        //itemCount: messageDocumentsList.length,
        itemBuilder: (context, i) {
          return messageTile(context, i);
        },
      ),
    );
  }

  Widget messageTile(BuildContext context, int i) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('message $i '),
      ],
    );
  }
}
*/
