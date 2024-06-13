import 'package:e_ticaret/screens/productDetail.dart';
import 'package:e_ticaret/utilities/constants.dart';
import 'package:flutter/material.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_PRODUCT_DETAIL: (BuildContext context) =>
        const ProductDetail()
  };
}
