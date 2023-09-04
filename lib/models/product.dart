import 'dart:core';

import 'package:flutter/material.dart';

class Product {
 bool isFav=false ;
  Color favColor = const Color.fromARGB(137, 152, 152, 152);
 final dynamic id ;
 final String title;
 final String description;
 final dynamic price ;
 final String category;
 final dynamic discountPercentage;
 final dynamic rating ;
 final dynamic stock ;
 final String brand ;
 final  String thumbnail;
 final List<dynamic>  images;
 Product({required this.id,required this.title,required this.description,required this.price,required this.discountPercentage,
   required this.rating,required this.stock,required this.brand,
   required this.category,required this.thumbnail,required this.images});

static List<Product> convertToProduct(List products){
  List<Product> productList=[];
  for(var product in products) {
    // print(product['id'].runtimeType);
    // print(product['title'].runtimeType);
    // print(product['description'].runtimeType);
    // print(product['price'].runtimeType);
    // print(product['category'].runtimeType);
    // print(product['discountPercentage'].runtimeType);
    // print(product['rating'].runtimeType);
    // print(product['stock'].runtimeType);
    // print(product['brand'].runtimeType);
    // print(product['thumbnail'].runtimeType);
    // print(product['images'].runtimeType);

    if(product['id']==null||product['title']==null||product['description']==null||
        product['price']==null||product['discountPercentage']==null||product['category']==null||
        product['rating']==null||product['stock']==null||product['brand']==null||product['thumbnail']==null)
      {
        continue;
      }

    productList.add(
        Product(id: product["id"],
            title: product["title"],
            description: product["description"],
            price: product["price"],
            discountPercentage: product["discountPercentage"],
            rating: product["rating"],
            stock: product["stock"],
            brand: product["brand"],
            category: product["category"],
            thumbnail: product["thumbnail"],
            images: product["images"])
    );
  }
  return productList;
}
}
