
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logindemo1/launchingpage.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:starflut/starflut.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras =await availableCameras();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User user) {
    if (user == null) {
      print('User is currently signed out!');
      runApp(MyApp(cameras));
    } else {
      print('User is signed in!');
      runApp(lpage(cameras));

    }
  });

}

class MyApp extends StatelessWidget {
  @override
  var cameras;
  MyApp(this.cameras);
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
        home:

        LoginPage(cameras));
  }
}
