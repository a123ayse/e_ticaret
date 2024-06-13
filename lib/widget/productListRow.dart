// ignore_for_file: file_names

import 'package:e_ticaret/utilities/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductListRow extends StatelessWidget {
  String name;
  int currentPrice;
  int orginalPrice;
  int discount;
  String imageUrl;

  ProductListRow({
    super.key,
    required this.name,
    required this.currentPrice,
    required this.orginalPrice,
    required this.discount,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildProductItemCard(context),
        _buildProductItemCard(context),
      ],
    );
  }

  _buildProductItemCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Constants.ROUTE_PRODUCT_DETAIL);
      },
      child: Card(
        child: Column(
          children: [
            SizedBox(
              //height: 300,
              width: MediaQuery.of(context).size.width / 2.2,
              child: Image.network(imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: [
                  Text(name,
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.grey)),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("\$$currentPrice",
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.black)),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text("\$$orginalPrice",
                          style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough)),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text("$discount% Discount",
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          )),
                      const SizedBox(
                        width: 8.0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
