import 'WheatherApp/weatherScreen.dart';
import 'WillPopScope.dart';
import 'tabs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'PageView.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}
