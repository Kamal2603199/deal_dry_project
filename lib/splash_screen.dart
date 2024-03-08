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
        SplashScreenModel splashScreenModel = SplashScreenModel.fromJson(jsonDecode(response.body));
        // Data fetched successfully, navigate to next screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage(data: splashScreenModel.data)),
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
        child: _isLoading ? CircularProgressIndicator() : Container(),
      ),
    );
  }
}

 class SplashScreenModel {
  final Data data;

  SplashScreenModel({required this.data});

  factory SplashScreenModel.fromJson(Map<String, dynamic> json) {
    return SplashScreenModel(
      data: Data.fromJson(json['data']),
    );
  }
}

