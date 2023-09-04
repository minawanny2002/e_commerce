import 'package:flutter/material.dart';
import 'package:e_commerce/const.dart';
import 'package:e_commerce/models/product.dart';

import 'ProductPage.dart';
import 'favs.dart';

class ProductContainer extends StatefulWidget {
  Product product;
  ProductContainer(this.product);

  @override
  State<ProductContainer> createState() => _ProductContainerState(product);
}

class _ProductContainerState extends State<ProductContainer> {
  Product product;
  _ProductContainerState(this.product);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(product)));
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color(0xffB81736),
                    blurRadius: 15.0,
                    offset: Offset(0, 0.75))
              ]),
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 10,
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      widget.product.thumbnail,
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Text(widget.product.title),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 20,
                      ),
                      Text(
                        widget.product.price.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Icon(
                        Icons.attach_money_sharp,
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              if (widget.product.isFav == false) {
                                widget.product.isFav = true;
                                Favorites.favProducts.add(widget.product);
                                widget.product.favColor = Colors.red;
                                print("object");
                              } else if (widget.product.isFav == true) {
                                widget.product.isFav = false;
                                Favorites.favProducts.remove(widget.product);
                                widget.product.favColor =
                                    const Color.fromARGB(137, 152, 152, 152);
                              }
                            });
                          },
                          child: Icon(
                            Icons.favorite,
                            color: widget.product.favColor,
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
