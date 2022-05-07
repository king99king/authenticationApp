import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class homescreen extends StatelessWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:Container(
        child: FlatButton(onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.pop(context);
        },
          child: Text('log out'),),
      ),
    ));
  }
}
