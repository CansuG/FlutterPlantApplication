import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/models/favorites_model.dart';
import 'package:plant_app/screens/info_screen.dart';
import 'package:provider/provider.dart';

import '../components/plant_widget.dart';
import '../constants.dart';
import '../models/cart_model.dart';
import '../models/plants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Plant> _plantList = Plant.plantList;

    //Plants category
    List<String> _plantTypes = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
    ];

    //Favorite button
    bool toggleIsFavorited(bool isFavorited) {
      return !isFavorited;
    }

    bool toggleIsSelected(bool isAddedToCart) {
      return !isAddedToCart;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    width: size.width * .9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.8),
                        ),
                        const Expanded(
                          child: TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                              hintText: ' Search',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.mic, color: Colors.black54.withOpacity(.8)),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              height: 50,
              width: size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _plantTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(_plantTypes[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: selectedIndex == index
                                  ? Constants.primaryColor
                                  : Constants.blackColor,
                            )),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: InfoPage(
                                plantID: index,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 40,
                              width: 40,
                              child: Selector<FavoritesModel, bool>(
                                builder: (context, isFavoritedProvider, child) {
                                  return IconButton(
                                    onPressed: () {
                                      bool isFavorited = toggleIsFavorited(
                                          _plantList[index].isFavorited);
                                      _plantList[index].isFavorited = isFavorited;

                                      if (isFavoritedProvider == false) {
                                        Provider.of<FavoritesModel>(context,
                                            listen: false)
                                            .addToFavoritesItem(_plantList[index]);
                                      } else {
                                        Provider.of<FavoritesModel>(context,
                                            listen: false)
                                            .deleteFromFavorites(_plantList[index]);
                                      }
                                    },
                                    icon: Icon(isFavoritedProvider == true
                                        ? Icons.favorite
                                        : Icons.favorite_border),
                                    color: Constants.primaryColor,
                                    iconSize: 24,
                                  );
                                },
                                selector: (context, model) => _plantList[index].isFavorited,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 60,
                              right: 20,
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Selector<CartModel, bool>
                                  (builder: (context, isSelectedProvider, child){
                                    return IconButton(
                                      onPressed: () {
                                        bool isSelected =
                                        toggleIsSelected(_plantList[index].isSelected);

                                        _plantList[index].isSelected = isSelected;

                                        if (isSelected == true) {
                                          Provider.of<CartModel>(context, listen: false)
                                              .addCartItem(_plantList[index]);
                                        } else {
                                          Provider.of<CartModel>(context, listen: false)
                                              .deleteCartItem(_plantList[index]);
                                        }
                                      },
                                      icon: Icon(_plantList[index].isSelected == true
                                          ? Icons.shopping_cart
                                          : Icons.shopping_cart_outlined),
                                        color: Constants.primaryColor,
                                    );
                                }, selector: (context, model) => _plantList[index].isSelected),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),),
                          Positioned(
                            left: 50,
                            right: 50,
                            top: 50,
                            bottom: 50,
                            child: Image.asset(_plantList[index].imageURL),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _plantList[index].category,
                                  style: const TextStyle(
                                    color: Colors.white60,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  _plantList[index].plantName,
                                  style: const TextStyle(
                                    color: Colors.white60,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 15,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 2.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                r'$' + _plantList[index].price.toString(),
                                style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: const Text(
                'Newcomers',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: size.height * 0.6,
              child: ListView.builder(
                  itemCount: _plantList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return PlantWidget(
                      index: selectedIndex,
                      plantList: _plantList,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
