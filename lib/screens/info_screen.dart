import 'package:flutter/material.dart';
import 'package:plant_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/cart_model.dart';
import '../models/favorites_model.dart';
import '../models/plants.dart';

class InfoPage extends StatefulWidget {
  final int plantID;

  const InfoPage({Key? key, required this.plantID}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  //Favorite toggle
  bool toggleIsFavorited(bool isFavorited) {
    return !isFavorited;
  }

  //toggle and add/remove cart
  bool toggleIsSelected(bool isAddedToCart) {
    return !isAddedToCart;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    child: ChangeNotifierProvider(
                      create: (context )=> FavoritesModel(),
                      child:IconButton(
                        onPressed: () {
                        },
                        icon: Icon(_plantList[widget.plantID].isFavorited == true
                            ? Icons.favorite
                            : Icons.favorite_border),
                        color: Constants.primaryColor,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 100,
                    child: SizedBox(
                      height: 320,
                      child: Image.asset(_plantList[widget.plantID].imageURL),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    height: 180,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantFeature(
                              title: 'Size',
                              plantFeature: _plantList[widget.plantID].size),
                          PlantFeature(
                              title: 'Humidity',
                              plantFeature: _plantList[widget.plantID]
                                  .humidity
                                  .toString()),
                          PlantFeature(
                              title: 'Temperature',
                              plantFeature:
                                  _plantList[widget.plantID].temperature),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
              height: size.height * 0.50,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _plantList[widget.plantID].plantName,
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            r'$' + _plantList[widget.plantID].price.toString(),
                            style: TextStyle(
                              color: Constants.blackColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _plantList[widget.plantID].rating.toString(),
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontSize: 30,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Constants.primaryColor,
                            size: 30,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: Text(
                      _plantList[widget.plantID].description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        color: Constants.blackColor.withOpacity(0.7),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
          width: size.width * 0.9,
          height: 120,
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                child:
                ChangeNotifierProvider(
                  create: (context )=> CartModel(),
                  child:IconButton(
                    onPressed: () {
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: _plantList[widget.plantID].isSelected == true
                          ? Colors.white
                          : Constants.primaryColor,
                      size: 30,
                    ),

                  ),
                ),
                decoration: BoxDecoration(
                  color: _plantList[widget.plantID].isSelected == true
                      ? Constants.primaryColor.withOpacity(0.5)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 8,
                      color: Constants.primaryColor.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 5,
                        color: Constants.primaryColor.withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'BUY NOW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;

  const PlantFeature({
    Key? key,
    required this.plantFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
