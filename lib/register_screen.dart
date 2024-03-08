import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // a global key for the form
  final _formKey = GlobalKey<FormState>();
  // controllers for the text fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _referralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _referralCodeController,
                decoration: InputDecoration(
                  labelText: 'Referral Code',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your referral code';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Register'),
                onPressed: () {
                  // validate the form
                  if (_formKey.currentState!.validate()) {
                    // call the register function
                    register();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void register() async {
    // the API url
    var url = Uri.parse('http://devapiv3.dealsdray.com/api/v2/user/email/referral');
    // the data to send
    var data = {
      "email": _emailController.text,
      "password": _passwordController.text,
      "referralCode": _referralCodeController.text,
      "userId": "62a833766ec5dfd6780fc85", // hard-coded for demo purpose
    };
    // make the request and get the response
    var response = await http.post(url, body: json.encode(data));
    // print the response status code and body
    print(response.statusCode);
    print(response.body);
    // TODO: handle the response according to your logic
  }

}

