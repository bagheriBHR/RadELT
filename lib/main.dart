
import 'package:flutter/material.dart';
import 'package:RadELT/screens/music_player/music_player_screen.dart';
import 'package:RadELT/screens/splash_screen.dart';
import 'package:RadELT/screens/profile/profile_screen.dart';
import 'package:RadELT/screens/cache/cache_screen.dart';
import 'package:RadELT/screens/single/single_course.dart';
import 'package:RadELT/screens/login/register_screen.dart';
import 'package:RadELT/screens/login/login_screen.dart';
import 'package:RadELT/navs.dart';
import 'package:RadELT/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Vazir',
        scaffoldBackgroundColor: ScaffoldBgColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes:{
        // "/" : (context) => Directionality(textDirection: TextDirection.rtl,child: MusicApp()),
        "/" : (context) => Directionality(textDirection: TextDirection.rtl,child: SplashScreen()),
        "/profile" : (context) => Directionality(textDirection: TextDirection.rtl,child: ProfileScreen()),
        "/cache" : (context) => Directionality(textDirection: TextDirection.rtl,child: CacheScreen()),
        "/single" : (context) => Directionality(textDirection: TextDirection.rtl,child: SingleCourse()),
        "/register" : (context) => Directionality(textDirection: TextDirection.rtl,child: RegisterScreen()),
        "/login" : (context) => Directionality(textDirection: TextDirection.rtl,child: LoginScreen()),
        "/home" : (context) => Directionality(textDirection:TextDirection.rtl,child: Navs()),
      },
    );
  }
}
