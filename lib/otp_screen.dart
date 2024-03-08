import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // a global key for the form
  final _formKey = GlobalKey<FormState>();
  // a controller for the text field
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _otpController,
                decoration: InputDecoration(
                  labelText: 'OTP',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your OTP';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Verify'),
                onPressed: () {
                  // validate the form
                  if (_formKey.currentState!.validate()) {
                    // call the verify function
                    verify(_otpController.text);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void verify(String otp) async {
    print(otp);
    var response = await http.post(
      Uri.parse('http://devapiv3.dealsdray.com/api/v2/user/otp/verification'),
      body: jsonEncode(
          {
            "otp":otp,
            "deviceId": "65e9684a01c8e299aad2633f",
            "userId": "65e9686601c8e299aad26343"
          }),
      headers: {
        'Content-Type': 'application/json',
        // Add any required headers here
      },
    );
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    ApiResponse apiResponse = ApiResponse.fromJson(jsonResponse);
    if(apiResponse.status == 1) {
      print("------otp is verified-----");
      // otp verified
      if(apiResponse.data.registrationStatus == "Incomplete") {
        Navigator.pushNamed(context, "/profilePage");
      } else {
        Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(
            builder: (context) =>
            const HomeScreen(),
            //       ChangeNotifierProvider(
            //   create: (context) => CartModel(),
            //   child: const DashBoardPage(),
            // ),
            //
          ),
              (route) => false,
        );
      }
    } else if(apiResponse.status == 3) {
      print("------otp is not verified-----");

      // invalid OTP

    } else {
      print("-----------unhandled Otp status code ---------");
    }
    // print the response status code and body
    print(response.statusCode);
    print(response.body);
    // TODO: handle the response according to your logic
  }
}

class ApiResponse {
  final int status;
  final ApiData data;

  ApiResponse({required this.status, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      data: ApiData.fromJson(json['data']),
    );
  }
}

class ApiData {
  final String? message;
  final String? registrationStatus;

  ApiData({required this.message, required this.registrationStatus});

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      message: json['message'],
      registrationStatus: json['registration_status'],
    );
  }
}