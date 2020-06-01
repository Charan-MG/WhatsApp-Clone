import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp__clone/provider/image_upload_provider.dart';
import 'package:whatsapp__clone/provider/user_provider.dart';
import 'package:whatsapp__clone/resources/auth_method.dart';
import 'package:whatsapp__clone/screens/home_screen.dart';
import 'package:whatsapp__clone/screens/login_screen.dart';
import 'package:whatsapp__clone/screens/pages/widgets/user_circle.dart';
import 'package:whatsapp__clone/screens/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImageUploadProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child:MaterialApp(
      title: "WhatsApp Clone",
      theme: new ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff24d464),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/search_screen': (context) => SearchScreen(),
        '/menu_screen': (context) => UserCircle(),
      },
      home: FutureBuilder(
        future: _authMethods.getCurrentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    ));
  }
}