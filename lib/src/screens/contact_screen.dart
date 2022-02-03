


import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({ Key? key }) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      
    );
  }
}