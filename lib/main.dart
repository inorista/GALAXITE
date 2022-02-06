import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travel/screens/splash_screen.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GALAXYITE',
      theme: ThemeData(
        fontFamily: "OpenSans",
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xfff6f6f6),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
