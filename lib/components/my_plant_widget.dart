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
        color: Constants.primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 80.0,
      padding: const EdgeInsets.only(left: 10, top: 2),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage(widget.plantList[widget.index].imageURL),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                borderRadius: BorderRadius.circular(6),
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
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Constants.blackColor,
                      ),
                    ),
                    Text(
                      widget.plantList[widget.index].size,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
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
            padding: const EdgeInsets.only(right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isWatered = !_isWatered;
                    });
                  },
                  icon: Icon(
                    _isWatered
                        ? Icons.water_drop_rounded
                        : Icons.water_drop_outlined,
                    size: 28,
                  ),
                  color: Colors.lightBlueAccent,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _hasSunlight = !_hasSunlight;
                    });
                  },
                  icon: Icon(
                      _hasSunlight
                          ? Icons.light_mode
                          : Icons.light_mode_outlined,
                      size: 28),
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
