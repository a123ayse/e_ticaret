import 'package:e_ticaret/widget/productListRow.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product List",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFDDBEA9),
        centerTitle: true,
      ),
      body: _buildProductListPage(context),
    );
  }

  Widget _buildProductListPage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    if (screenSize == null) {
      // Handle the case when screenSize is null
      return Container(); // or any default value
    }
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildFilterWidgets(screenSize);
        } else if (index == 4) {
          return const Text("Products");
        } else {
          return _buildProductListRow(index);
        }
      },
    );
  }

  Widget _buildProductListRow(int index) {
    List<String> imageUrls = [
      'https://cdn.dsmcdn.com/mnresize/1200/1800/ty1114/product/media/images/prod/SPM/PIM/20231230/12/70f225f2-42e1-3d31-92e2-9be40aaf84c9/1_org_zoom.jpg',
      'https://cdn.dsmcdn.com/mnresize/1200/1800/ty1114/product/media/images/prod/SPM/PIM/20231230/12/70f225f2-42e1-3d31-92e2-9be40aaf84c9/1_org_zoom.jpg',
      'https://cdn.dsmcdn.com/mnresize/1200/1800/ty1114/product/media/images/prod/SPM/PIM/20231230/12/7a6f879e-07da-3c03-b7a6-a7140c83b209/1_org_zoom.jpg',
      'https://cdn.dsmcdn.com/mnresize/1200/1800/ty1107/product/media/images/prod/SPM/PIM/20231226/01/a4bb30da-85b1-3e97-9cff-7b603de43f93/1_org_zoom.jpg',
    ];

    return ProductListRow(
      name: "Product",
      currentPrice: 150 + index * 10,
      orginalPrice: 200 + index * 10,
      discount: 30,
      imageUrl: imageUrls[index],
    );
  }

  Widget _buildFilterWidgets(Size screenSize) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenSize.width,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFilterButton("Sort"),
              Container(
                color: Colors.black,
                width: 2.0,
                height: 40.0,
              ),
              _buildFilterButton("Filter"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton(String title) {
    return InkWell(
      child: Row(
        children: [
          const Icon(Icons.arrow_drop_down, color: Colors.black),
          const SizedBox(
            width: 2.0,
          ),
          Text(title),
        ],
      ),
    );
  }
}
