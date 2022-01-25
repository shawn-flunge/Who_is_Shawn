

import 'package:flutter/material.dart';
import 'package:who_is_shawn/src/screens/main_screen.dart';



class WhoIsShawn extends StatelessWidget {
  const WhoIsShawn({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Who is Shawn??',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Gothic_A1'
      ),
      navigatorKey: navigatorKey,
      home: const MainScreen(),
    );
  }
}

