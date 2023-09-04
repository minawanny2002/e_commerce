import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:e_commerce/NavBar.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/Data/dio_helper.dart';
import 'package:e_commerce/Most%20selling.dart';
import 'package:e_commerce/allproducts.dart';
import 'package:e_commerce/main.dart';
import 'package:e_commerce/product_container.dart';
import 'package:e_commerce/settings.dart';
import 'cart.dart';
import 'favs.dart';
import 'models/product.dart';

class ApiConst {
  static const String baseUrl = 'https://dummyjson.com';
  static const String endPoint = '/products';
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    print("object");
  }

//felgeb
  @override
  Widget build(BuildContext context) {
    print(NavBar.products.length);
    if (NavBar.products.isEmpty) {
      return const Scaffold(
        backgroundColor: CupertinoColors.black,
        body: Center(
            child: CircularProgressIndicator(
          color: Color(0xffB81736),
        )),
      );
    } else {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: CupertinoColors.black,
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              )),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    const Text(
                      "Most selling",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              )),
              SliverToBoxAdapter(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: MostSelling(NavBar.products))),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              )),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    const Text(
                      "All Products",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
              ),
              AllProducts(NavBar.products),
            ],
          ));
    }
  }
}
