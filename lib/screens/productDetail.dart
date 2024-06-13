// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with TickerProviderStateMixin {
  // Create a TabController as a class member
  late TabController imagesController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController in the initState method
    imagesController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose the TabController to avoid memory leaks
    imagesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 40.0, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _buildProductDetails(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildProductDetails(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImages(),
              _buildProductPrice(),
              const SizedBox(
                height: 12.0,
              ),
              _buildProductTitle(),
              const SizedBox(
                height: 12.0,
              ),
              _buildDivider(size),
              const SizedBox(
                height: 12.0,
              ),
              _builderFurtherInfo(),
              const SizedBox(
                height: 12.0,
              ),
              _buildDivider(size),
              const SizedBox(
                height: 12.0,
              ),
              _buildSizeArea(),
              const SizedBox(
                height: 12.0,
              ),
              _buildInfo(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildProductImages() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 270,
        child: Center(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: [
                TabBarView(
                  controller: imagesController,
                  children: [
                    Image.network(
                      'https://cdn.dsmcdn.com/mnresize/1200/1800/ty1114/product/media/images/prod/SPM/PIM/20231230/12/70f225f2-42e1-3d31-92e2-9be40aaf84c9/1_org_zoom.jpg',
                    ),
                    Image.network(
                      'https://cdn.dsmcdn.com/mnresize/1200/1800/ty1107/product/media/images/prod/SPM/PIM/20231226/01/a4bb30da-85b1-3e97-9cff-7b603de43f93/1_org_zoom.jpg',
                    ),
                    Image.network(
                      'https://cdn.dsmcdn.com/mnresize/1200/1800/ty1114/product/media/images/prod/SPM/PIM/20231230/12/7a6f879e-07da-3c03-b7a6-a7140c83b209/1_org_zoom.jpg',
                    ),
                  ],
                ),
                Container(
                  alignment: const FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.grey,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductPrice() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          "Wool Sweater",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildProductTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Text(
            "\$ 100",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "\$ 200",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "\$ 50 Discount",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(Size? screenSize) {
    if (screenSize == null) {
      return const SizedBox(height: 0.0);
    }
    return Column(
      children: [
        Container(
          color: Colors.grey,
          width: screenSize.width,
          height: 0.25,
        )
      ],
    );
  }

  Widget _builderFurtherInfo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Icon(
            Icons.local_offer,
            color: Colors.black,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "Click here for more information.",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget _buildSizeArea() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.straighten, color: Colors.grey),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Size : M",
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Size Chart",
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInfo() {
    TabController tabController = TabController(length: 2, vsync: this);
    return Column(
      children: [
        TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              child: Text("Product Information"),
            ),
            Tab(
              child: Text("Washing Instructions"),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 200, // Uygun bir değeri seçebilirsiniz
            child: TabBarView(
              controller: tabController,
              children: const [
                Text(
                  "%30 Cotton",
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                Text(
                  "Wash at 30 degrees",
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Row(
                children: [
                  Icon(Icons.heart_broken_sharp, color: Colors.white),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "Add to favourites",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              child: const Row(
                children: [
                  Icon(Icons.shopping_basket, color: Colors.white),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "Add to basket",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
