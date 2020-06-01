import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp__clone/assets/whatsapp_icons.dart';
import 'package:whatsapp__clone/enum/user_state.dart';
import 'package:whatsapp__clone/models/user.dart';
import 'package:whatsapp__clone/provider/user_provider.dart';
import 'package:whatsapp__clone/resources/auth_method.dart';
import 'package:whatsapp__clone/screens/chatscreens/widgets/cached_image.dart';
import 'package:whatsapp__clone/screens/login_screen.dart';
import 'package:whatsapp__clone/widgets/appbar.dart';

class UserDetailsContainer extends StatelessWidget {
  final AuthMethods authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    signOut() async {
      final bool isLoggedOut = await AuthMethods().signOut();
      if (isLoggedOut) {
        // set userState to offline as the user logs out'
        authMethods.setUserState(
          userId: userProvider.getUser.uid,
          userState: UserState.Offline,
        );

        // move the user to login screen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
        );
      }
    }

    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          CustomAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.maybePop(context),
            ),
            centerTitle: true,
            title: Icon(Whatsapp.whatsapp, size: 50, color: Colors.white),
            actions: <Widget>[
              FlatButton(color: Colors.red,
                onPressed: () => signOut(),
                child: Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )
            ],
          ),
          UserDetailsBody(),
        ],
      ),
    );
  }
}

class UserDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final User user = userProvider.getUser;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          CachedImage(
            user.profilePhoto,
            isRound: true,
            radius: 50,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                user.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                user.email,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}