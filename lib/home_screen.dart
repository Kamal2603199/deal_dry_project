import 'package:cs_tech/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // a function to fetch the data from the API
  // Future<List<Product>> fetchProducts() async {
  //   // the API url
  //   var url = Uri.parse('http://devapiv3.dealsdray.com/api/v2/user/home/withoutPrice');
  //   // make the request and get the response
  //   var response = await http.get(url);
  //   // parse the response body as a list of maps
  //   var products = json.decode(response.body) as List;
  //   // map each map to a Product object and return a list of products
  //   return products.map((product) => Product.fromJson(product)).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      //  body: FutureBuilder<List<Product>>(
      //   future: fetchProducts(), // the future to fetch the data
      //   builder: (context, snapshot) {
      //     // check the snapshot state
      //     if (snapshot.hasData) {
      //       // get the list of products from the snapshot data
      //       var products = snapshot.data!;
      //       // return a list view of product cards
      //       return ListView.builder(
      //         itemCount: products.length,
      //         itemBuilder: (context, index) {
      //           // get the product at the index
      //           var product = products[index];
      //           // return a product card widget
      //           return ProductCard(product: product);
      //         },
      //       );
      //     } else if (snapshot.hasError) {
      //       // return an error message
      //       return Center(
      //         child: Text('Something went wrong: ${snapshot.error}'),
      //       );
      //     } else {
      //       // return a loading indicator
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
    );
  }
}