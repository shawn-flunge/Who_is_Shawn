

import 'package:flutter/material.dart';
import 'package:who_is_shawn/screens/main_screen.dart';




class WhoIsShawn extends StatelessWidget {
  const WhoIsShawn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Who is Shawn??',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

