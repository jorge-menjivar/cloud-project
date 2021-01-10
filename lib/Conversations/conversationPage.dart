import 'package:flutter/material.dart';
import 'package:first_flutter_project/widgets/ChatAppBar.dart';
import 'package:first_flutter_project/widgets/ChatListWidget.dart';
import 'package:first_flutter_project/widgets/InputWidget.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: ChatAppBar(), // Custom app bar for chat screen
            body: Stack(children: <Widget>[
              Column(
                children: <Widget>[
                  ChatListWidget(), //Chat list
                  InputWidget() // The input widget
                ],
              ),
            ])));
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
