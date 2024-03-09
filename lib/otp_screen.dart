import 'package:cs_tech/model/device_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home_screen.dart';

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
            children: [ Image.asset(
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
                  primary: Colors.redAccent, // Change the background color here
                ),
                child: Text('Verify'),
                onPressed: () {
                  // validate the form
                  if (_formKey.currentState!.validate()) {
                    // call the verify function
                    verify(_otpController.text, deviceInfo);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void verify(String otp, DeviceInfo deviceInfo) async {
    var response = await http.post(
      Uri.parse('http://devapiv3.dealsdray.com/api/v2/user/otp/verification'),
      body: jsonEncode(
          {
            "otp":otp,
            "deviceId": deviceInfo.deviceId,
            "userId": deviceInfo.userId
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
      print(deviceInfo.userId);
      print(deviceInfo.deviceId);
      print(deviceInfo.mobileNumber);
      // otp verified
      if(apiResponse.data.registrationStatus == "Incomplete") {
        Navigator.pushNamed(context, "/profilePage", arguments:
        DeviceInfo(
            mobileNumber: deviceInfo.mobileNumber,
            userId: deviceInfo.userId,
            deviceId: deviceInfo.deviceId)
        );
      } else {
        Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(
            builder: (context) =>
            Home(),
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