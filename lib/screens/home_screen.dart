import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp__clone/enum/user_state.dart';
import 'package:whatsapp__clone/provider/user_provider.dart';
import 'package:whatsapp__clone/resources/auth_method.dart';
import 'package:whatsapp__clone/screens/call_screen/pickup/pickup_layout.dart';
import 'package:whatsapp__clone/screens/pages/calls.dart';
import 'package:whatsapp__clone/screens/pages/camera.dart';
import 'package:whatsapp__clone/screens/pages/chat_list_screen.dart';
import 'package:whatsapp__clone/screens/pages/status.dart';
import 'package:whatsapp__clone/screens/pages/widgets/user_circle.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {

  UserProvider userProvider;

  final AuthMethods _authMethods = AuthMethods();

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    String currentUserId =
        (userProvider != null && userProvider.getUser != null)
            ? userProvider.getUser.uid
            : "";

    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        currentUserId != null
            ? _authMethods.setUserState(
                userId: currentUserId, userState: UserState.Online)
            : print("resume state");
        break;
      case AppLifecycleState.inactive:
        currentUserId != null
            ? _authMethods.setUserState(
                userId: currentUserId, userState: UserState.Offline)
            : print("inactive state");
        break;
      case AppLifecycleState.paused:
        currentUserId != null
            ? _authMethods.setUserState(
                userId: currentUserId, userState: UserState.Waiting)
            : print("paused state");
        break;
      case AppLifecycleState.detached:
        currentUserId != null
            ? _authMethods.setUserState(
                userId: currentUserId, userState: UserState.Offline)
            : print("detached state");
        break;
    }
  }


  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.refreshUser();

      _authMethods.setUserState(
        userId: userProvider.getUser.uid,
        userState: UserState.Online, 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      scaffold: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("WhatsApp"),
            elevation: 0.7,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(text: "CHATS"),
                Tab(
                  text: "STATUS",
                ),
                Tab(
                  text: "CALLS",
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed:(){
              Navigator.pushNamed(context, "/search_screen");
            },),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
              ),
              UserCircle(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
              ),
              
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              CameraApp(),
              ChatListScreen(),
              Status(),
              Calls()
            ],
          ),
        ),
      ),
    );
  }
}

