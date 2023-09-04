import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/cart.dart';
import 'package:e_commerce/favs.dart';
import 'package:e_commerce/mainScreen.dart';
import 'package:e_commerce/settings.dart';

import 'Data/dio_helper.dart';
import 'models/product.dart';

class NavBar extends StatefulWidget {
  // This widget is the root of your application.
  static List<Product> products = [];

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<NavBar> {
  // This widget is the root of your application.
  List<Widget> navigation = [
    const HomeScreen(),
    const FavScreen(),
    const cartScreen(),
    settings()
  ];
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    List productslist = await DioHelper().getProducts();
    NavBar.products = Product.convertToProduct(productslist);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          extendBody: true,
          // resizeToAvoidBottomInset: false,
          bottomNavigationBar: DotNavigationBar(
            splashColor: Colors.black,
            splashBorderRadius: 100,
            backgroundColor: Color(0xffB81736),
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            dotIndicatorColor: Color(0xffB81736),
            unselectedItemColor: Colors.grey[300],
            enableFloatingNavBar: true,
            onTap: _handleIndexChanged,
            items: [
              /// Home
              DotNavigationBarItem(
                icon: const Icon(Icons.home),
                selectedColor: Colors.black54,
              ),

              /// favorites
              DotNavigationBarItem(
                icon: const Icon(Icons.favorite),
                selectedColor: Colors.black54,
              ),

              /// cart
              DotNavigationBarItem(
                icon: const Icon(Icons.shopping_bag),
                selectedColor: Colors.black54,
              ),

              /// settings
              DotNavigationBarItem(
                icon: const Icon(Icons.settings),
                selectedColor: Colors.black54,
              ),
            ],
          ),
          body: navigation[_selectedTab.index]),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
