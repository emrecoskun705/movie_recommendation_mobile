import 'package:flutter/material.dart';

import 'package:movie_recommandation/pages/home_page.dart';
import 'package:movie_recommandation/pages/recommend_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
    );
  }
}
