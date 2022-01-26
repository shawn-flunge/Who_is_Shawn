import 'package:flutter/material.dart';
import 'package:who_is_shawn/src/providers/page_provider.dart';
import 'package:who_is_shawn/src/providers/experience_provider.dart';
import 'package:who_is_shawn/src/who_is_shawn.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageProvider()),
        ChangeNotifierProvider(create: (_) => ExperienceProvider())
      ],
      child: const WhoIsShawn(),
    )
  );
}

