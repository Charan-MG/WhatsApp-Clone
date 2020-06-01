import 'package:flutter/material.dart';
import 'package:whatsapp__clone/screens/search_screen.dart';

class NewChatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.chat,
        color: Colors.white,
        size: 25,
      ),
        onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
        )); 
  }
}