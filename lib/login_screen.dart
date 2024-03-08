import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/device_info.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required data});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // a global key for the form
  final _formKey = GlobalKey<FormState>();
  // controllers for the text fields
  final _mobileController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.length < 10 || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Login'),
                onPressed: () {
                  // validate the form
                  if (_formKey.currentState!.validate()) {
                    // call the login function
                    login();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void login() async {
    // the API url
    var url = Uri.parse('http://devapiv3.dealsdray.com/api/v2/user/otp');
    // the data to send
    var data = {
      "mobileNumber": _mobileController.text,
      "deviceId": "65e9684a01c8e299aad2633f",
    };
    print(data);
    var response = await http.post(
      Uri.parse('http://devapiv3.dealsdray.com/api/v2/user/otp'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        // Add any required headers here
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      ApiResponse apiResponse = ApiResponse.fromJson(jsonResponse);
      //StatusResponse otpResponse = StatusResponse.fromJson(response['data']);
      // Parse response body using the SplashScreen model
      //SplashScreenModel splashScreenModel = SplashScreenModel.fromJson(jsonDecode(response.body));
      // Data fetched successfully, navigate to next screen
     // Navigator.of(context).pushReplacement(
       // MaterialPageRoute(builder: (context) => LoginPage(data: splashScreenModel.data)),
      // );
      Navigator.pushNamed(
        context,
        "/otpVerification",
        arguments: DeviceInfo(apiResponse.data.userId, apiResponse.data.deviceId ),
      );
      print(apiResponse.status);
      print(apiResponse.data.userId);
    } else {
      // Error occurred, handle appropriately
      print('Failed to fetch data: ${response.statusCode}');
      // Show error message or retry option
    }
    print(response);
    print(response.body);
    // TODO: handle the response according to your logic
  }
}

class LoginScreenModel {
  final Data data;

  LoginScreenModel({required this.data});

  factory LoginScreenModel.fromJson(Map<String, dynamic> json) {
    return LoginScreenModel(
      data: Data.fromJson(json['data']),
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
  final String message;
  final String userId;
  final String deviceId;

  ApiData({required this.message, required this.userId, required this.deviceId});

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      message: json['message'],
      userId: json['userId'],
      deviceId: json['deviceId'],
    );
  }
}
