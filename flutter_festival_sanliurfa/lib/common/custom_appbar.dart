import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
    String title, {
    Key? key,
  }) : super(
          key: key,
          backgroundColor: Colors.blue,
          title: Text(
            title,
          ),
          elevation: 0.0,
        );
}
