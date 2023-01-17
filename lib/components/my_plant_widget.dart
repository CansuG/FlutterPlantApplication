import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/my_plants.dart';

class MyPlantWidget extends StatefulWidget {
  final int index;
  final List<MyPlant> plantList;

  const MyPlantWidget({
    Key? key,
    required this.index,
    required this.plantList,
  }) : super(key: key);

  @override
  State<MyPlantWidget> createState() => _MyPlantWidgetState();
}

class _MyPlantWidgetState extends State<MyPlantWidget> {
  bool _isWatered = false;
  bool _hasSunlight = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Constants.primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 80.0,
      padding: const EdgeInsets.only(left: 10, top: 10),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.plantList[widget.index].imageURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.plantList[widget.index].plantName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Constants.blackColor,
                      ),
                    ),
                    Text(
                      widget.plantList[widget.index].size,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Constants.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isWatered = !_isWatered;
                    });
                  },
                  icon: Icon(_isWatered
                      ? Icons.water_drop_rounded
                      : Icons.water_drop_outlined),
                  color: Colors.lightBlueAccent,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _hasSunlight = !_hasSunlight;
                    });
                  },
                  icon: Icon(_hasSunlight
                      ? Icons.light_mode
                      : Icons.light_mode_outlined),
                  color: Colors.amber,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*
class MyPlantWidget extends StatelessWidget {
  const MyPlantWidget({
    Key? key,
    required this.index,
    required this.plantList,
  }) : super(key: key);

  final int index;
  final List<MyPlant> plantList;

  bool toggleIsWatered(bool isWatered) {
    return !isWatered;
  }

  bool toggleHaveSunlight(bool haveSunlight) {
    return !haveSunlight;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Constants.primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 80.0,
      padding: const EdgeInsets.only(left: 10, top: 10),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(plantList[index].imageURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(plantList[index].plantName),
                    Text(
                      plantList[index].size,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Constants.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(plantList[index].isWatered
                      ? Icons.water_drop_rounded
                      : Icons.water_drop),
                  iconSize: 30,
                  onPressed: () {
                    bool isWatered =
                    toggleIsWatered(plantList[index].isWatered);

                    plantList[index].isWatered= isWatered;
                  },
                ),
                IconButton(
                  onPressed: () {
                    bool isWatered =
                        toggleIsWatered(plantList[index].isWatered);

                    plantList[index].isWatered= isWatered;
                  },
                  icon: Icon(plantList[index].isWatered == true
                      ? Icons.water_drop_rounded
                      : Icons.water_drop_outlined),
                ),
                IconButton(
                  onPressed: () {
                    bool haveSunLight =
                    toggleIsWatered(plantList[index].haveSunlight);

                    plantList[index].haveSunlight= haveSunLight;
                  },
                  icon: Icon(plantList[index].haveSunlight == true
                      ? Icons.light_mode
                      : Icons.light_mode_outlined),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}*/
