import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import './signup2.dart';

class SignupPage1 extends StatefulWidget {
  @override
  _SignupPageState1 createState() => _SignupPageState1();
}

class _SignupPageState1 extends State<SignupPage1> {
  bool signUpEmail = false;
  bool con = false;
  DateTime _selectedDateTime = DateTime.now();

  bool ifContinue() {
    return con;
  }

  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }

  Widget name() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full name',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              prefixText: '   ',
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 5),
              hintText: 'first name last name',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget withEmailOption() {
    return Container(
      alignment: Alignment.bottomRight,
      child: FlatButton(
        onPressed: () => {
          setState(
            () {
              signUpEmail = true;
            },
          ),
        },
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'Sign up with Email',
          style: TextStyle(
            color: Colors.black45,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget withPhoneOption() {
    return Container(
      alignment: Alignment.bottomRight,
      child: FlatButton(
        onPressed: () => {
          setState(
            () {
              signUpEmail = false;
            },
          ),
        },
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'Sign up with Phone Number',
          style: TextStyle(
            color: Colors.black45,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget phone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone number',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              // ignore: deprecated_member_use
              WhitelistingTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              prefixText: '   ',
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 5),
              hintText: 'Phone number',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              prefixText: '   ',
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 5),
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget dateofBirth() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Date of Birth',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CupertinoDateTextBox(
            initialValue: _selectedDateTime,
            onDateChange: onBirthdayChange,
            hintText: DateFormat.yMd().format(_selectedDateTime),
            hintColor: Colors.black38,
          ),
        ),
      ],
    );
  }

  Widget main1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        name(),
        SizedBox(height: 10),
        dateofBirth(),
        SizedBox(height: 10),
        if (signUpEmail) email(),
        if (signUpEmail == false) phone(),
        SizedBox(height: 10),
        continueB(),
        SizedBox(height: 10),
        if (signUpEmail) withPhoneOption(),
        if (signUpEmail == false) withEmailOption(),
      ],
    );
  }

  Widget continueB() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
      width: double.infinity,
      child: RaisedButton(
          elevation: 5,
          onPressed: () => {
                con = true,
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupPage2(),
                  ),
                ),

                //print('continue pressed'),
              },
          padding: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.white,
          child: Text(
            'CONTINUE',
            style: TextStyle(
              color: Color(0xff5ac18e),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x995ac18e),
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 30,
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: main1(),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
