import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O'
    ];
    final List<int> colorCodes = <int>[700, 400, 100];
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Example'),
        // Listview ทำให้สามารถเลื่อนหน้าจอนึง กล่องก้เพิ่มเข้ามา (สร้างทีละตัวเมื่อกล่องโผล่เข้ามาในจอ)
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(9.0),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          // 5. ใส่ค่า return เปน producttitle ที่กำหนดไว้
          return ProductTitle(
            item: ProductItem(
              name: 'Product ${entries[index]}',
              price: '฿25',
              colorShade: colorCodes[index % 3],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}

class ProductItem {
  // 1. เป็น class มาไว้เก็บค่า (final คือตัวแปรที่ไม่เปลี่ยนค่าแน่ๆ)

  final String name;
  final String price;
  final int colorShade;

  const ProductItem(
      // 2. กำหนด class มาแล้ว ตรงนี้จะเปนตัวบอกว่ามีการเกบค่าไว้ให้แล้วที่ this.ชื่อตัวแปร
      {Key? key,
      required this.name,
      required this.price,
      required this.colorShade});
}

// 3. สร้าง statelesswidget return container
class ProductTitle extends StatelessWidget {
  // 4. ประกาศตัวแปร + Key,key required , super key
  final ProductItem item;

  const ProductTitle({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 7. ใส่ gesturedetector ว่าถ้ากด แล้วใช้โชว์ค่า
    return GestureDetector(
      onTap: () {
        // ใช้ push เพื่อให้โชว์หน้าใหม่ที่มีค่า item ตามที่ต้องการ
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(item: item),
          ),
        );
      },
      child: Container(
        height: 100,
        color: Colors.amber[item.colorShade],
        child: Center(
          child: Text('${item.name}'),
        ),
      ),
    );
  }
}

// 6. สร้าง class Product detail เพื่อให้ดึงขึ้นไปโชว์
class ProductDetail extends StatelessWidget {
// หน้า product detail
  final ProductItem item;

  const ProductDetail({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Product Name: ${item.name}'),
          Text('Price: ${item.price}'),
        ],
      ),
    );
  }
}
