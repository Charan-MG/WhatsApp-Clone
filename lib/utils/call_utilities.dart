import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp__clone/models/call.dart';
import 'package:whatsapp__clone/models/user.dart';
import 'package:whatsapp__clone/resources/call_method.dart';
import 'package:whatsapp__clone/screens/call_screen/call_screen.dart';

class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial({User from, User to, context}) async {
    Call call = Call(
      callerId: from.uid,
      callerName: from.name,
      callerPic: from.profilePhoto,
      receiverId: to.uid,
      receiverName: to.name,
      receiverPic: to.profilePhoto,
      channelId: Random().nextInt(1000).toString(),
    );

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallScreen(call: call),
          ));
    }
  }
}