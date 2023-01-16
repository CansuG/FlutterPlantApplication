import 'package:flutter/material.dart';
import 'package:plant_app/models/favorites_model.dart';
import 'package:provider/provider.dart';

import '../components/plant_widget.dart';
import '../constants.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        child: Consumer<FavoritesModel>(
          builder: (context, model, child) {
            if (model.addedToFavorites.isEmpty) {
              return favoritesIsEmpty();
            }
            return ListView.builder(
              itemCount: model.addedToFavorites.length,
              itemBuilder: (context, index) {
                return PlantWidget(
                    index: index, plantList: model.addedToFavorites);
              },
            );
    }));
  }

  Widget favoritesIsEmpty() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            child: Image.asset("assets/images/favorited.png"),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Favorited Plants',
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
