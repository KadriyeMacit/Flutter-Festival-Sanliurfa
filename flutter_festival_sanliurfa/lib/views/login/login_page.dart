import 'package:flutter/material.dart';
import 'package:flutter_festival_sanliurfa/common/custom_appbar.dart';
import 'package:flutter_festival_sanliurfa/services/auth_service.dart';
import 'package:flutter_festival_sanliurfa/views/home/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Giriş"),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImage(context),
            const SizedBox(
              height: 50,
            ),
            _buildEmailTextField(),
            const SizedBox(
              height: 20,
            ),
            _buildPasswordTextField(),
            const SizedBox(
              height: 20,
            ),
            _buildLoginButton(),
            const SizedBox(
              height: 20,
            ),
            _buildGoogleButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/images/a.png',
        height: size.height * .3,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildLoginButton() {
    return InkWell(
        onTap: () => _loginWithEmail(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 40,
          child: const Center(
            child: Text(
              "Giriş yap",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ));
  }

  Widget _buildEmailTextField() {
    return Material(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextField(
          focusNode: _emailFocus,
          controller: _emailController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Mail adresi",
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Material(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextField(
          focusNode: _passwordFocus,
          obscureText: true,
          controller: _passwordController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Parola",
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }

  void _loginWithEmail() {
    _authService
        .signInWithEmail(
      _emailController.text,
      _passwordController.text,
    )
        .then((value) {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
    });
  }

  Widget _buildGoogleButton() {
    return InkWell(
      onTap: () => _loginWithGoogle(),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 2),
            color: Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: _buildGoogleButtonBody(),
        ),
      ),
    );
  }

  Widget _buildGoogleButtonBody() {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        FaIcon(
          FontAwesomeIcons.google,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Google ile giriş yap',
          style: TextStyle(color: Colors.white),
        ),
      ],
    ));
  }

  void _loginWithGoogle() {
    _authService.signInWithGoogle().then((value) {
      return Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
    });
  }
}
