import 'package:afchat/provider/authentication_provider.dart';
import 'package:afchat/services/navigation_services.dart';
import 'package:afchat/widgets/custom_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late double _deviceWidth;
  late double _deviceHeight;
  final _formKey = GlobalKey<FormState>();

  late AuthenticationProvider _auth;
  late NavigationServices _navigation;

  String? _email;
  String? _password;


  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _auth = Provider.of<AuthenticationProvider>(context);
    _navigation = GetIt.instance.get<NavigationServices>();
    return _BuildUI();
  }

  Widget _BuildUI() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: _deviceWidth * 0.03, vertical: _deviceHeight * 0.02),
          height: _deviceHeight,
          width: _deviceWidth,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _pageTitle(),
              SizedBox(
                height: _deviceHeight * 0.04,
              ),
              _loginForm(),
              SizedBox(
                height: _deviceHeight * 0.04,
              ),
              _loginButton(),
              SizedBox(
                height: _deviceHeight * 0.04,
              ),
              _registerAccountLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return Container(
      height: _deviceHeight * 0.10,
      child: Text(
        "AfChat",
        style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: _deviceHeight * 0.18,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomInputField(
              onSaved: (_value) {
                setState(() {
                  _email = _value;
                });
              },
              regEx: r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
              hintText: 'Email',
              obscureText: false,
            ),
            CustomInputField(
              onSaved: (_value) {
                setState(() {
                  _password = _value;
                });
              },
              regEx: r'{.8,}',
              hintText: 'Password',
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return RoundedButton(
      name: 'Login',
      height: _deviceHeight * 0.065,
      width: _deviceWidth * 0.65,
      onPressed: () {
        if(_formKey.currentState != null){
          _formKey.currentState!.save();
          _auth.loginWithEmailAndPassword(_email!, _password!);
        }
      },
    );
  }
  Widget _registerAccountLink(){
    return GestureDetector(
      onTap: (){},
      child: Container(
        child: Text('Dont\'t hava an account',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}
