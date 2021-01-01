import 'package:flutter/material.dart';
import 'login.dart';
import 'signup1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0x995ac18e),
              elevation: 0,
              bottom: TabBar(
                labelColor: Colors.yellowAccent,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Color(0x995ac18e),
                ),
                tabs: [
                  Tab(
                    text: 'Log In',
                  ),
                  Tab(
                    text: 'Sign Up',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                LoginPage(),
                SignupPage1(),
              ],
            )),
      ),
    );
  }
}
