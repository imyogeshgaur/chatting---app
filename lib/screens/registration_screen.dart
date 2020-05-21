import 'package:chatapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/component/rounded_button.dart';
import 'package:chatapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';


class RegistrationScreen extends StatefulWidget {
 static const String id ='registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  String email,password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
                  tag: 'logo',
                  child:Container(
                  child: Image.asset('images/logo.png'),
                  height: 200.0,
                ),
                ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration:  kdeTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
               obscureText: true,
               textAlign: TextAlign.center,
               onChanged: (value) {
                password  = value;
              },
               decoration: kdeTextFieldDecoration.copyWith(hintText: 'Enter your Password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(title:"Register",colour:Colors.blue,onPressed: ()async{
               try
               {
                  
             final newuser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
              if(newuser!=null){
                Navigator.pushNamed(context,ChatScreen.id);
              }
               }catch(e){
                  print(e);
               }

            },),
          ],
        ),
      ),
    );
  }
}
