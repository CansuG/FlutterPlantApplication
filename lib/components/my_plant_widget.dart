import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../models/my_plants.dart';

class MyPlantWidget extends StatelessWidget {
  // 1
  final MyPlant item;

  // 2
  final Function(bool?)? onWatered;

  // 3
  final TextDecoration textDecoration;

  // 4
  MyPlantWidget({
    Key? key,
    required this.item,
    this.onWatered,
  })  : textDecoration =
  item.isWatered ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 2
          Container(width: 5.0, color: Constants.primaryColor),
          // 4
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 5
              Text(
                item.plantName,
                style: GoogleFonts.lato(
                    decoration: textDecoration,
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4.0),
              Text(
                item.myPlantName!,
                style: GoogleFonts.lato(
                    decoration: textDecoration),
              ),
              const SizedBox(height: 4.0),
              Text(
                item.size!,
                style: GoogleFonts.lato(
                    decoration: textDecoration),
              ),
              const SizedBox(height: 4.0),
              Text(
                item.description!,
                style: GoogleFonts.lato(
                    decoration: textDecoration),
              ),
            ],
          ),
          // 3
          const SizedBox(width: 20.0),
          // 6
          Row(
            children: [
              // 7
              Text(
                'Is watered',
                style: GoogleFonts.lato(
                    decoration: textDecoration, fontSize: 21.0),
              ),
              // 8
              buildCheckbox(),
            ],
          ),
        ],
      ),
    );
  }


  Widget buildCheckbox() {
    return Checkbox(
      // 1
      value: item.isWatered,
      // 2
      onChanged: onWatered,
    );
  }
}
