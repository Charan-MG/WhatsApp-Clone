import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  StatusState createState() => StatusState();
}

class StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF25d366),
          child: Icon(Icons.photo_camera,color: Colors.white,),
          onPressed: null),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg'),
            ),
            title: Text('My Status'),
            subtitle: Text('Tap to Add Status'),
          ),
          Container(
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width,
            height: 20.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Recent updates',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg'),
            ),
            title: Text('Rahul'),
            subtitle: Text('Tap to Add Status'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg'),
            ),
            title: Text('Yash'),
            subtitle: Text('Tap to Add Status'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg'),
            ),
            title: Text('Chaithresh'),
            subtitle: Text('Tap to Add Status'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg'),
            ),
            title: Text('Roshan'),
            subtitle: Text('Tap to Add Status'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg'),
            ),
            title: Text('Madhu'),
            subtitle: Text('Tap to Add Status'),
          ),
        ],
      ),
    );
  }
}

