import 'package:flutter/cupertino.dart';
// import 'package:untitled4/productContainer.dart';

import 'models/product.dart';
import 'product_container.dart';

class MostSelling extends StatelessWidget {
  List<Product> products = [];
  @override
  MostSelling(this.products);
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemExtent: 200,
      addRepaintBoundaries: true,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: 7,
      itemBuilder: (_, index) {
        return Container(
            margin: EdgeInsets.all(8),
            child: ProductContainer(products[index]));
      },
    );
  }
}
