import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/const.dart';
import 'package:e_commerce/models/product.dart';

import 'product_container.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<StatefulWidget> createState() => FavScreenState();
}

class FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    // Favorites.favProducts.add(Favorites.product!);
    print(Favorites.favProducts);
    return Scaffold(
      body: Column(
          // width:  MediaQuery.of(context).size.width,
          // height:  MediaQuery.of(context).size.height,
          children: [
            Expanded(
              child: GridView.builder(
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.all(8),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisExtent: 300,
                    mainAxisSpacing: 12.0),
                itemCount: Favorites.favProducts.length,
                itemBuilder: (_, index) {
                  return GridTile(
                      child: ProductContainer(Favorites.favProducts[index]));
                },
              ),
            ),
          ]),
    );
  }
}
