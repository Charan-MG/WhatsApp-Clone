import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final Widget title;
  final List<Widget> actions;
  final Widget leading;
  final bool centerTitle;

  const CustomAppBar({
    Key key,
    @required this.title,
    @required this.actions,
    @required this.leading, 
    @required this.centerTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color:  Color(0xff075E54),
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: 1.4,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: AppBar(
        backgroundColor:  Color(0xff075E54),
        elevation: 0,
        leading: leading,
        actions: actions,
        centerTitle: centerTitle,
        title: title,
      ),
    );
  }

  final Size preferredSize = const Size.fromHeight(kToolbarHeight+10);
}