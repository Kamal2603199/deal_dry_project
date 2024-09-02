import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}
class Product {
  final String name;
  final String imagePath;
  final String discount;

  Product({required this.name, required this.imagePath, required this.discount});
}
class _HomeState extends State<Home> {
  void handleMenuClick(String value) {
    switch (value) {
      case 'My Account':
        print("My account menu is selected.");
        break;
      case 'Settings':
        print("Settings menu is selected.");
        break;
      case 'Logout':
        print("Logout menu is selected.");
        break;
    }
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Categories Page'),
    Text('Deals Page'),
    Text('Cart Page'),
    Text('Profile Page'),
  ];
  List<String> newArrivalsImages = [];
  List<UnboxedDeal> unboxedDeals = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  Future<void> fetchImages() async {
    final response = await http.get(
      Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/home/withoutPrice'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      ApiResponse apiResponse = ApiResponse.fromJson(jsonResponse);
      setState(() {
        unboxedDeals =  apiResponse.data.unboxedDeals;
      });
    } else {
      throw Exception('Failed to load deals');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: false, // Left-to-right scrolling
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.network(
                      'http://devapiv4.dealsdray.com/icons/banner.png',
                      height: 180,
                      width: 280,
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.network(
                      'http://devapiv4.dealsdray.com/icons/discount_banner.png',
                      height: 180,
                      width: 280,
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.network(
                      'http://devapiv4.dealsdray.com/icons/Image -97.png',
                      height: 180,
                      width: 280,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true, // Right-to-left scrolling
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                      'http://devapiv4.dealsdray.com/icons/cat_mobile.png',
                      height: 100,
                      width: 80,
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                      'http://devapiv4.dealsdray.com/icons/cat_lap.png',
                      height: 100,
                      width: 80,
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                      'http://devapiv4.dealsdray.com/icons/cat_camera.png',
                      height: 100,
                      width: 80,
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                      'http://devapiv4.dealsdray.com/icons/cat_led.png',
                      height: 100,
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width:  MediaQuery.of(context).size.width,
              height : 500,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'EXCLUSIVE FOR YOU',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward, color: Colors.white,),

                          ),
                          // Add any other widgets for top-right
                        ],
                      ),),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: unboxedDeals.length,
                              itemBuilder: (BuildContext context, int index) {
                                final product = unboxedDeals[index];
                                print(product.label);
                                return Column(
                                  children: [
                                    // Cards for products
                                    // Example card
                                    Card(
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        width: 200,
                                        height: 400,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 20),

                                            Stack(
                                                children : [
                                                  Image.network(
                                                    product.icon, // Provide your image path here
                                                    width: 180,
                                                    height: 300,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                  Positioned(
                                                    top: 0,
                                                    right: 0,
                                                    child: Container(
                                                      padding: EdgeInsets.all(4),
                                                      color: Colors.red,
                                                      child: Text(
                                                        product.offer,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                            SizedBox(height:4),
                                            Text(
                                              '₹',
                                            ),
                                            Text(
                                              product.label,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Add more cards for products here
                                  ],);
                              }),)
                    )]),),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer,
            ),
            label: 'Deals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor : Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DealItem {
  final String icon;
  final String offer;
  final String label;

  DealItem({
    required this.icon,
    required this.offer,
    required this.label,
  });
}


class ApiResponse {
  final int status;
  final Data data;

  ApiResponse({required this.status, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final List<UnboxedDeal> unboxedDeals;

  Data({required this.unboxedDeals});

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['unboxed_deals'] as List;
    List<UnboxedDeal> unboxedDealsList =
    list.map((i) => UnboxedDeal.fromJson(i)).toList();

    return Data(
      unboxedDeals: unboxedDealsList,
    );
  }
}

class UnboxedDeal {
  final String icon;
  final String offer;
  final String label;

  UnboxedDeal({
    required this.icon,
    required this.offer,
    required this.label,
  });

  factory UnboxedDeal.fromJson(Map<String, dynamic> json) {
    return UnboxedDeal(
      icon: json['icon'],
      offer: json['offer'],
      label: json['label'],
    );
  }
}