import 'package:flutter/material.dart';

class Calls extends StatefulWidget{
  CallsState createState() => CallsState();
}
class CallsState extends State<Calls>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg'),
          ),
          title: Text('Yash'),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.arrow_downward, color: Colors.red,),
              Text('Today 1:25 pm'),
            ],
          ),
          trailing: Icon(Icons.phone, color: Color(0xFF075e54),),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg'),
          ),
          title: Text('Madhu'),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.arrow_downward, color: Colors.red,),
              Text('Today 1:25 pm'),
            ],
          ),
          trailing: Icon(Icons.phone, color: Color(0xFF075e54),),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg'),
          ),
          title: Text('Yash'),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.arrow_upward, color: Colors.green,),
              Text('Today 1:25 pm'),
            ],
          ),
          trailing: Icon(Icons.phone, color: Color(0xFF075e54),),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg'),
          ),
          title: Text('Roshan'),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.arrow_upward, color: Colors.green,),
              Text('Today 1:25 pm'),
            ],
          ),
          trailing: Icon(Icons.video_call, color: Color(0xFF075e54),),
        ),

      ],
    );
  }

}