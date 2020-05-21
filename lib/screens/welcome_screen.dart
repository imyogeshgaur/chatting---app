import 'package:chatapp/component/rounded_button.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id ='welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin{

AnimationController controller;
Animation animation1,animation2,animation3;

@override
void initState(){
  super.initState();

  controller = AnimationController(duration: Duration(seconds: 16),vsync: this);
  animation1 = 
  ColorTween(begin:Colors.red,end:Colors.white).animate(controller);
  animation2 = ColorTween(begin: Colors.lightBlueAccent,end: Colors.red).animate(controller);
  animation3 = ColorTween(begin: Colors.blueAccent,end: Colors.green).animate(controller);
  controller.forward();
  controller.addListener(() {
    setState(() {
      
     });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:animation1.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child:Container(
                  child: Image.asset('images/logo.png'),
                  height: 60.0
                ),
                ),
                TypewriterAnimatedTextKit(
                 text: ['ChatterBox'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
            title:'Log In',
            colour:animation2.value,
            onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },),
             RoundedButton(
            title:'Registration',
            colour:animation3.value,
            onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },),
          ],
        ),
      ), 
    );
  }
}

