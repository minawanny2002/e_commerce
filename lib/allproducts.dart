// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
// import 'package:untitled4/productContainer.dart';
import 'models/product.dart';
import 'product_container.dart';

class AllProducts extends StatelessWidget{
  List<Product>products=[];
  AllProducts(this.products, {super.key});
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisExtent: 300,
          mainAxisSpacing: 12.0
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: products.length,
            (context, index) => GridTile(child: ProductContainer(products[index])),
      ),
    );
  }

}