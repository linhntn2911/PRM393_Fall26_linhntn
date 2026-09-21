import 'package:flutter/material.dart';
// Import class Product từ thư mục data/model
import '../../data/model/Product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      child: Column(
        // Sắp xếp giao diện theo chiều dọc
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Image.network(
                  "${product.imageUrl}",
                  width: 300,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                // Button trên ảnh (đặt ở góc dưới bên phải)
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white)),
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Name: ${product.name}"),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Price: "),
                        Text("Old: ${product.price}\$", style: TextStyle(color: Colors.blue)),
                        Text("Sale: 20\$", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Text("${product.description}"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}