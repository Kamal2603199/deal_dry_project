import 'package:cs_tech/model/device_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home_screen.dart';
import 'register_page.dart'; // Import your RegisterPage

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key}) : super();

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
    final DeviceInfo deviceInfo = ModalRoute.of(context)?.settings.arguments as DeviceInfo ?? DeviceInfo(mobileNumber: "", userId: "", deviceId: "");

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
              Image.asset(
                "assets/images/otp_verification.png", // Change this to your image path
                width: 550, // Adjust the width as needed
                height: 345, // Adjust the height as needed
              ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent, // Change the background color here
                ),
                child: Text('Verify'),
                onPressed: () {
                  // Directly navigate to the RegisterPage without verifying the OTP
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(), // Navigate to RegisterPage
                      settings: RouteSettings(arguments: deviceInfo),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
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
