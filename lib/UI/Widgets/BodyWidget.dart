import 'package:flutter/material.dart';
import '../../data/model/Product.dart';
import 'ProductWidget.dart';

class BodyWidget extends StatelessWidget {
  BodyWidget({super.key});

  // Danh sách các sản phẩm hiển thị theo chiều dọc
  final List<Product> product = [

    Product(
      id: '1',
      name: 'Meo Meo',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdX2sb_TPGBAAJ_twqc2yfuM4uOkAvIX3HxvlInKM8WwECsW4ZCOcPiWxv&s=10',
      price: 30,
      description: 'CÔNG BỐ KẾT QUẢ CUỘC THI ẢNH Chủ đề: mèo, chó 1 Giải Đặc Biệt: 20 tràng pháo tay 2 Giải Nhất: 10 tràng pháo tay 3 Giải Nhì: 5 tràng pháo tay 4 Giải Ba: 2 tràng',
    ),
    Product(
      id: '2',
      name: 'Cat funny',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdX2sb_TPGBAAJ_twqc2yfuM4uOkAvIX3HxvlInKM8WwECsW4ZCOcPiWxv&s=10',
      price: 50,
      description: 'Mô tả sản phẩm thứ 2',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      // scrollDirection: Axis.vertical là mặc định
      children: product.map((p) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ProductWidget(product: p),
          ),
        );
      }).toList(),
    );
  }
}

///////////////////////////////////////////////////////////////////////

// child: Text.rich(
//   TextSpan(
//     text: 'Xin chao ',
//     style: TextStyle(color: Colors.red),
//     children: <TextSpan>[
//       TextSpan(
//         text: 'Cac ban ',
//         style: TextStyle(
//           color: Colors.cyan,
//           fontWeight: FontWeight.bold,
//           fontSize: 45
//         ),
//       ),
//       TextSpan(
//         text: 'Chung toi',
//         style: TextStyle(color: Colors.green),
//
//       )
//     ],
//   ),
// ),