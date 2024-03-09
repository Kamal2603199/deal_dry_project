import 'package:cs_tech/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/device_info.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    print("fetch data");
    try {
      var data = {
        "deviceType": "andriod",
        "deviceId": "C6179909526098",
        "deviceName": "Samsung-MT200",
        "deviceOSVersion": "2.3.6",
        "deviceIPAddress": "11.433.445.66",
        "lat": 9.9312,
        "long": 76.2673,
        "buyer_gcmid": "",
        "buyer_pemid": "",
        "app": {
          "version": "1.20.5",
          "installTimeStamp": "2022-02-10T12:33:30.696Z",
          "uninstallTimeStamp": "2022-02-10T12:33:30.696Z",
          "downloadTimeStamp": "2022-02-10T12:33:30.696Z"
        }
      };
      var response = await http.post(
        Uri.parse('http://devapiv3.dealsdray.com/api/v2/user/device/add'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
          // Add any required headers here
        },
      );


      if (response.statusCode == 200) {
        // Parse response body using the SplashScreen model

        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        ApiResponse apiResponse = ApiResponse.fromJson(jsonResponse);

        await Future.delayed(Duration(seconds: 3));

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage(data: apiResponse.data)),
        );
      } else {
        // Error occurred, handle appropriately
        print('Failed to fetch data: ${response.statusCode}');
        // Show error message or retry option
      }
    } catch (e) {
      print('Error: $e');
      // Handle network error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading ? CircularProgressIndicator() :  Stack(
          children: [
            Image.asset(
              "assets/images/splash_image.png", // Your image path here
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            // You can add any widgets over the image if needed
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
  final String message;
  final String deviceId;

  ApiData({required this.message, required this.deviceId});

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      message: json['message'],
      deviceId: json['deviceId'],
    );
  }
}