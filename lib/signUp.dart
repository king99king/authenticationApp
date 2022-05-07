
import 'package:chatappnew/signUp.dart';
import 'package:chatappnew/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final _email=TextEditingController();
  final _password=TextEditingController();
  final _userName=TextEditingController();

  String get email=> _email.text.trim();
  String get pass=> _password.text.trim();
  String get use=> _userName.text.trim();

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
                          key: ValueKey('username'),
                          validator:(value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter valid email';
                            }
                            return null;
                          },

                          decoration: InputDecoration(
                            labelText: 'username',

                          ),
                          keyboardType: TextInputType.text,
                          controller:_userName ,
                        ),
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
                          onChanged: (value){
                            print('kkkkk');
                          },

                          decoration: InputDecoration(
                            labelText: 'password',

                          ),
                          keyboardType: TextInputType.visiblePassword,
                          controller:_password ,

                        ),
                        FlatButton(
                            onPressed: (){
                              FirebaseAuth.instance.createUserWithEmailAndPassword
                                (email: email, password: pass).then((value) {

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => signapp()));

                              }).onError((error, stackTrace){
                                print("Error ${error.toString()}");


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
