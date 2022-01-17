import 'package:flutter/material.dart';
import 'package:who_is_shawn/providers/page_provider.dart';
import 'package:who_is_shawn/who_is_shawn.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageProvider())
      ],
      child: const WhoIsShawn(),
    )
  );
}

