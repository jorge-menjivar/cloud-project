import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ChatItemWidget.dart';

class ChatListWidget extends StatelessWidget {
  ChatListWidget({@required this.querySnapshots});
  final List<QueryDocumentSnapshot> querySnapshots;

  final ScrollController listScrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
        child: ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemBuilder: (context, index) => ChatItemWidget(
        index,
        text: querySnapshots[index].data()['text'],
        time: querySnapshots[index].data()['time_epoch'],
        from: querySnapshots[index].data()['from'],
      ),
      itemCount: (querySnapshots != null) ? querySnapshots.length : 0,
      reverse: true,
      controller: listScrollController,
    ));
  }
}
