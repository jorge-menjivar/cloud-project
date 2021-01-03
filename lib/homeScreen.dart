import 'package:flutter/material.dart';

import 'Widgets/Category_selector.dart';
import 'Widgets/favorite_contacts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.menu),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {}),
            title: const Text('       My Chats',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: () {}),
            ]),
        body: Column(
          children: <Widget>[
            CategorySelector(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    FavoriteContacts(),
                    Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
