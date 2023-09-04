import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/sliders.dart';

class ProductPage extends StatefulWidget {
  Product product;
  ProductPage(this.product);

  @override
  State<StatefulWidget> createState() => ProductPageState(product);
}

class ProductPageState extends State<ProductPage> {
  Product product;
  ProductPageState(this.product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: CupertinoColors.black,
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
              Carousel(product),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 10),
              Center(
                child: Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB81736),
                    wordSpacing: 5,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  wordSpacing: 5,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.height / 50,
                  ),
                  Text(
                    "Brand: " + product.brand,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      wordSpacing: 5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.height / 50,
                  ),
                  Text(
                    "Price: " + product.price.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB81736),
                      wordSpacing: 5,
                    ),
                  ),
                  Icon(
                    Icons.attach_money,
                    color: Color(0xffB81736),
                    size: 35,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
