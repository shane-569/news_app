import 'package:flutter/material.dart';

class ApplicationBar extends StatefulWidget with PreferredSizeWidget {
  const ApplicationBar(
      {Key? key, required this.appBarName, required this.isLeading})
      : super(key: key);

  final String appBarName;
  final bool isLeading;

  @override
  _ApplicationBarState createState() => _ApplicationBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _ApplicationBarState extends State<ApplicationBar> {
  String? version;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      automaticallyImplyLeading: widget.isLeading,
      iconTheme: IconThemeData(
        color: Colors.blue[400], //change your color here
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(color: Colors.transparent),
      ),
      title: Text(
        widget.appBarName,
        style: TextStyle(color: Colors.blue[400], fontWeight: FontWeight.w400),
      ),
      backgroundColor: Colors.white,
      elevation: 3,
      actions: <Widget>[],
    );
  }
}
