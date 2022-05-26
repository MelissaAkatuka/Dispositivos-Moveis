// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:learning_english/views/home.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: const Color(0xff795548),
      scaffoldBackgroundColor: const Color(0xfff5e9b9)
    ),
  ));
}

