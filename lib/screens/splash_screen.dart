import 'package:RadELT/helpers/check_connection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  navigateToLogin(){
    return Navigator.pushReplacementNamed(context, '/login');
  }
  navigateToHome(){
    return Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    // TODO: implement initState
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
          fit: StackFit.expand,
          children:[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    width:200,
                    height:200,
                    child: Image.asset('assets/images/Logo Square.png'),
                  ),
                ]
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:30.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.black87),
                  )
              ),
            )
          ]
      ),
    );
  }

  void checkLogin() async{
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String apiToken = prefs.getString('user.api_token');

    if (await checkConnectivity()) {
      // await AuthService.checkApiToken(apiToken)
      //     ? navigateToHome()
      //     : navigateToLogin();
      navigateToLogin();
    }else{
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(
              duration: Duration(hours: 2),
              content: GestureDetector(
                onTap: (){
                  _scaffoldKey.currentState.hideCurrentSnackBar();
                  checkLogin();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('اتصال به اینترنت وجود ندارد'),
                    Icon(Icons.network_locked)
                  ],
                ),
              )
          )
      );
    }
  }
}
