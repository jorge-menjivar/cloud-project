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
  List<QuerySnapshot> _list;

  @override
  void initState() {
    // TODO: implement initState
    downloadData();
    super.initState();
  }

  Future<void> downloadData() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('conversations')
        .doc('convo1')
        .collection('messages')
        .get();

    _list = querySnapshot.docs.cast<QuerySnapshot>().toList();
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
                ChatListWidget(querySnapshot: _list), //Chat list
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
