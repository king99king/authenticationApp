



import 'package:chatappnew/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homeScreen.dart';



class signapp extends StatefulWidget {
  const signapp({Key? key}) : super(key: key);

  @override
  _signappState createState() => _signappState();
}

class _signappState extends State<signapp> {
  final _email=TextEditingController();
  final _password=TextEditingController();

  String get email=> _email.text.trim();
  String get pass=> _password.text.trim();

  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(
          backgroundColor: Colors.pink,
          body:Center(
            child: SingleChildScrollView(
              child: Form(
                child:Card (
                     margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          key: ValueKey('email'),
                          validator:(value) {
                                if (value!.isEmpty || !value.contains('@')) {
                                return 'Please enter valid email';
                                }
                                return null;
                                },

                          decoration: InputDecoration(
                           labelText: 'email',

                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller:_email ,
                        ),
                        TextFormField(
                          obscureText: true,
                          key: ValueKey('password'),
                          validator:(value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter valid email';
                            }
                            return null;
                          },

                          decoration: InputDecoration(
                            labelText: 'password',

                          ),
                          keyboardType: TextInputType.visiblePassword,
                          controller:_password ,
                        ),
                        FlatButton(
                            onPressed: (){
                              FirebaseAuth.instance.signInWithEmailAndPassword(

                                  email: email, password: pass).then((value){
                             Navigator.pushReplacement(context,MaterialPageRoute(
                               builder: (context)=>homescreen(),

                             ));
                              }
                              ).onError((error, stackTrace){
                                 SnackBar(content: Text('password wrong'),


                                 );
                              });

                            },
                            child: Text('Signin')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )

    );
  }
}
