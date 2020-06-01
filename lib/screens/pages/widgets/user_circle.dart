import 'package:flutter/material.dart';
import 'package:whatsapp__clone/screens/pages/widgets/user_details_container.dart';

class UserCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     return GestureDetector(
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.white,
        builder: (context) => UserDetailsContainer(),
      ),
      child: Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xff075E54),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            // child: Text(
            //   Utils.getInitials(userProvider.getUser.name),
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black,
            //     fontSize: 13,
            //   ),
            // ),
            child: Icon(Icons.person),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.black, width: 2),
                  color: Colors.green),
            ),
          )
        ],
      ),
    ));
  }
}