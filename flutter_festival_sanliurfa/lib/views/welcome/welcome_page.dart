import 'package:flutter/material.dart';
import 'package:flutter_festival_sanliurfa/common/custom_appbar.dart';
import 'package:flutter_festival_sanliurfa/views/login/login_page.dart';
import 'package:flutter_festival_sanliurfa/views/register/register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Flutter Festival Şanlıurfa'),
      body: _body(context),
    );
  }

  Padding _body(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: ListView(
          children: [
            _bodyImage(context),
            const SizedBox(
              height: 50,
            ),
            _bodyColumn(context),
          ],
        ));
  }

  ClipRRect _bodyImage(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/images/b.png',
        height: size.height * .5,
        fit: BoxFit.fill,
      ),
    );
  }

  Column _bodyColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _loginButton(context),
        const SizedBox(
          height: 15,
        ),
        _registerButton(context),
      ],
    );
  }

  InkWell _loginButton(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 40,
          child: const Center(
            child: Text(
              'Giriş yap',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }

  InkWell _registerButton(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 40,
          child: const Center(
            child: Text(
              'Kayıt ol',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
