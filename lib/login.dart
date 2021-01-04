import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRememberMe = false;

  Widget email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email/Phone Number/Username',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            //keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.blueGrey,
              ),
              hintText: 'email',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget passWord() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.vpn_key,
                color: Colors.blueGrey,
              ),
              hintText: 'password',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /*Widget forgetPassword() {
    return Container(
      alignment: Alignment.bottomRight,
      child: FlatButton(
        onPressed: () => print('forget password pressed'),
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'forgot password?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }*/

  Widget forget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FlatButton(
          onPressed: () => print('forget email pressed'),
          padding: EdgeInsets.only(right: 0),
          child: Text(
            'forgot email?',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          ' | ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        FlatButton(
          onPressed: () => print('forget password pressed'),
          padding: EdgeInsets.only(right: 0),
          child: Text(
            'forgot password?',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget logIn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 17),
      width: double.infinity,
      child: RaisedButton(
          elevation: 5,
          onPressed: () => {
            // if log in successfully, 
            // go to home page
            print('sign in pressed'),
          },
          padding: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.white,
          child: Text(
            'LOGIN',
            style: TextStyle(
              color: Color(0xff5ac18e),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget rememberMe() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(
                  () {
                    isRememberMe = value;
                    //print('remember me');
                  },
                );
              },
            ),
          ),
          Text(
            'Remember me',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget or() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 2,
            color: Colors.black38,
          ),
        ),
        Text(
          ' or ',
          style: TextStyle(
            color: Colors.black38,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 2,
            color: Colors.black38,
          ),
        ),
      ],
    );
  }

  Widget logInWith() {
    return Column(
      children: [
        SizedBox(height: 10),
        Text(
          'Log in with',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget thirdPartySignIn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SignInButton(
          Buttons.FacebookNew,
          text: 'Log in with Facebook',
          onPressed: () => {
            print('log in with facebook pressed'),
          },
        ),
        SignInButton(
          Buttons.GoogleDark,
          text: 'Log in with Google',
          onPressed: () => {
            print(
              'log in with google pressed',
            ),
          },
        ),
        SignInButton(
          Buttons.Twitter,
          text: 'Log in with Twitter',
          onPressed: () => {
            print('log in with twitter pressed'),
          },
        ),
      ],
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
                  horizontal: 30,
                  vertical: 30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //SizedBox(height: 20),
                    email(),
                    SizedBox(height: 20),
                    passWord(),
                    SizedBox(height: 5),
                    forget(),
                    //forgetEmail(),
                    rememberMe(),
                    logIn(),
                    or(),
                    SizedBox(height: 20),
                    logInWith(),
                    SizedBox(height: 20),
                    thirdPartySignIn(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
