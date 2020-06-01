import 'package:flutter/material.dart';
import 'package:whatsapp__clone/models/call.dart';
import 'package:whatsapp__clone/resources/call_method.dart';
import 'package:whatsapp__clone/screens/call_screen/call_screen.dart';
import 'package:whatsapp__clone/screens/chatscreens/widgets/cached_image.dart';
import 'package:whatsapp__clone/utils/permission.dart';



class PickupScreen extends StatelessWidget {
  final Call call;
  final CallMethods callMethods = CallMethods();

  PickupScreen({
    @required this.call,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Incoming...",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            CachedImage(
              call.callerPic,
              isRound: true,
              radius: 180,
            ),
            SizedBox(height: 15),
            Text(
              call.callerName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.call_end,size: 50,color: Colors.white),
                  color: Colors.red[900],
                  onPressed: () async {
                    await callMethods.endCall(call: call);
                  },
                ),
                SizedBox(width: 50),
                FlatButton(
                  child: Icon(Icons.call,size: 50,color: Colors.white),
                  color: Colors.green,
                  onPressed: () async =>
                      await Permissions.cameraAndMicrophonePermissionsGranted()
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CallScreen(call: call),
                              ),
                            )
                          : {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}