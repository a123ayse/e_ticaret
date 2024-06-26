import 'package:e_ticaret/screens/productList.dart';
import 'package:e_ticaret/utilities/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      home: const ProductList(),
      routes: Routes.routes,
    );
  }
}
