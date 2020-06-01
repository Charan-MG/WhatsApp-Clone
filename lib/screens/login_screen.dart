import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:whatsapp__clone/assets/whatsapp_icons.dart';
import 'package:whatsapp__clone/resources/auth_method.dart';
import 'package:whatsapp__clone/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  bool isLoginPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xff25d366),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Whatsapp.whatsapp, size: 150, color: Colors.white),
                  SizedBox(height: 5),
                  Text("WhatsApp",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold)),
                  Text("Clone",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 50),
                  loginButton(),
                ],
              ),
            ),
          ),
          isLoginPressed
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Widget loginButton() {
    return GoogleSignInButton(
      onPressed: () => performLogin(),
    );
  }

  void performLogin() {
    print("tring to perform login");

     setState(() {
      isLoginPressed = true;
    });

    _authMethods.signIn().then((FirebaseUser user) {
      print("something");
      if (user != null) {
        authenticateUser(user);
      } else {
        print("There was an error");
      }
    });
  }

  void authenticateUser(FirebaseUser user) {
    _authMethods.authenticateUser(user).then((isNewUser) {
      setState(() {
        isLoginPressed = false;
      });
      if (isNewUser) {
        _authMethods.addDataToDb(user).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
        });
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      }
    });
  }
}
