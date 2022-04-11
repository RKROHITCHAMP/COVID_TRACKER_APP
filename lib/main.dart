import 'package:covid_19_tracker/constant.dart';
import 'package:covid_19_tracker/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primaryblack,
    ),
    home: homepage(),
  ));
}
