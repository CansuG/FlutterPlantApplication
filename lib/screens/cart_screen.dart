import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:plant_app/models/cart_model.dart';
import 'package:provider/provider.dart';

import '../components/plant_widget.dart';
import '../constants.dart';
import '../models/plants.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Consumer<CartModel>(builder: (context, model, child) {
        if (model.addedToCart.isEmpty) {
          return cartIsEmpty();
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: model.addedToCart.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return PlantWidget(
                        index: index, plantList: model.addedToCart);
                  },
                ),
              ),
              Column(
                children: [
                  const Divider(
                    thickness: 1.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        "\$" + calculateTotalPrice(model.addedToCart),
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  String calculateTotalPrice(List<Plant> cartList) {
    double totalPrice = 0;
    for (int i = 0; i < cartList.length; i++) {
      totalPrice += cartList[i].price;
    }
    return totalPrice.toStringAsFixed(2);
  }

  Widget cartIsEmpty() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            child: Image.asset("assets/images/add-cart.png"),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Your Cart is Empty',
            style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
