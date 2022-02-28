import 'package:flutter/material.dart';
import 'package:flutter_festival_sanliurfa/common/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Anasayfa"),
      body: const Center(
        child: Text("Hoş geldin!"),
      ),
    );
  }
}
