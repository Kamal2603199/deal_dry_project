import 'dart:convert';
import 'package:cs_tech/home_screen.dart';
import 'package:cs_tech/model/device_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();
  late DeviceInfo deviceInfo;

  Future<void> _submitData() async {
    print("success");

    try {
      final String name = _nameController.text;
      final String email = _emailController.text;
      final String referralCode = _referralCodeController.text;

      // Replace 'your_api_endpoint' with your actual API endpoint
      final Uri apiUrl = Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/email/referral');

      var response = await http.post(
        Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/otp/verification'),
        body: jsonEncode({
          'name': name,
          'email': email,
          'referral_code': referralCode,
          "userId": deviceInfo.userId
        }),
        headers: {
          'Content-Type': 'application/json',
          // Add any required headers here
        },
      );

      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        ApiResponse apiResponse = ApiResponse.fromJson(jsonResponse);

        Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(
            builder: (context) =>
                Home(),
          ),
              (route) => false,
        );
        // Handle success
        print('API call successful');
      } else {
        // Handle error
        print('API call failed');
      }
    } catch (error) {
      // Handle network error
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    deviceInfo = ModalRoute.of(context)?.settings.arguments as DeviceInfo ?? DeviceInfo(mobileNumber: "", userId: "", deviceId: "");

    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ Image.asset(
            "assets/images/register_image.png", // Change this to your image path
            width: 200, // Adjust the width as needed
            height: 150, // Adjust the height as needed
          ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _referralCodeController,
              decoration: InputDecoration(labelText: 'Referral Code (Optional)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Change the background color here
              ),
              onPressed: _submitData,
              child: Text('Submit'),
            ),
          ],
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
  // final String? registrationStatus;

  ApiData({required this.message,
    // required this.registrationStatus

  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      message: json['message'],
      // registrationStatus: json['registration_status'],
    );
  }
}