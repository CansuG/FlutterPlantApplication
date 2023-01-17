import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:plant_app/models/cart_model.dart';
import 'package:provider/provider.dart';

import '../components/my_plant_widget.dart';
import '../components/plant_widget.dart';
import '../constants.dart';
import '../models/my_plants.dart';
import '../models/plants.dart';

class MyPlantsListScreen extends StatelessWidget {
  const MyPlantsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  List<MyPlant> myPlants = MyPlant.myPlantList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text(
          'My Plants',
          style: TextStyle(
            color: Constants.blackColor,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: myPlants.length,
        itemBuilder: (context, index) {
          return MyPlantWidget(
              index: index, plantList: myPlants);
        },
      ),
    );


  }
}
