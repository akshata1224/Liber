import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  bool newuser;
  SharedPreferences localStorage;
  
  // ignore: non_constant_identifier_names
  void check_if_already_login() async{
    localStorage = await SharedPreferences.getInstance();
    newuser = (localStorage.getBool('login') ?? true);
    if(newuser == false){
      Navigator.pushNamed(context, '/mainscreen');
    }
    else{
      Navigator.pushNamed(context, '/reg');
    }
  }

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 7), finished);
  }

  void finished(){
    check_if_already_login();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LIB',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  ),
                  Text(
                  'ER',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  )
              ],
            )
          ),
        ),
    );
  }
}