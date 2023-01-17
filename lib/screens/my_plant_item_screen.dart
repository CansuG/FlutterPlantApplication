import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/models/plant_model.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../components/my_plant_widget.dart';
import '../models/my_plants.dart';

class AddMyPlantScreen extends StatefulWidget {
  final Function(MyPlant) onCreate;

  // 2
  final Function(MyPlant) onUpdate;

  // 3
  final MyPlant? originalItem;

  // 4
  final bool isUpdating;

  const AddMyPlantScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  @override
  State<AddMyPlantScreen> createState() => _AddMyPlantScreenState();
}

class _AddMyPlantScreenState extends State<AddMyPlantScreen> {
  final _nameController = TextEditingController();

  String? _size;
  String _plantName = '';
  String? _name; // my plant name
  String? _description ='';
  bool _isWatered = false;

  Color _currentColor = Colors.green;

  @override
  void initState() {

    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.myPlantName!;
      _name = originalItem.myPlantName;
      _plantName = originalItem.plantName;
      _size = originalItem.size;
      _description = originalItem.description;
      _isWatered = originalItem.isWatered;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      // 2
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {

              final plantItem = MyPlant(
                  plantId: widget.originalItem?.plantId ?? const Uuid().v1(),
                  size: _size,
                  plantName: _plantName,
                  myPlantName: _name,
                  description: _description,
                  isWatered: _isWatered
              );

              if(widget.isUpdating) {
                widget.onUpdate(plantItem);
                Provider.of<MyPlantModel>(context, listen:false).updateItem(plantItem, int.parse(plantItem.plantId));
              } else {
                widget.onCreate(plantItem);
                Provider.of<MyPlantModel>(context, listen:false).addItem(plantItem);
              }
            },
            icon: const Icon(Icons.check),
          )
        ],
        // 3
        elevation: 0.0,
        // 4
        title: Text(
          'My Plant',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildTextField('My Plant\'s name', 'You can type the name you gave your plant.'),
            buildTextField('Plant Type Name', 'E.g. rose, daisy...'),
            buildTextField('Plant Size', 'You can see the growth of your plant'),
            buildTextField('Description', 'You can type any note for yourself to remember'),
            const SizedBox(height: 10.0),
            buildColorPicker(context),
            const SizedBox(height: 10.0),
            MyPlantWidget(item: MyPlant(
                plantId: 'previewMode',
                plantName: _plantName,
                myPlantName: _name,
                size: _size,
                description: _description,
                isWatered: _isWatered
            ),),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String text, String _hintText) {
    // 1
    return Column(
      // 2
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 3
        Text(
          text,
          style: GoogleFonts.lato(fontSize: 28.0),
        ), // 4
        TextField(
          // 5
          controller: _nameController,
          // 5
          cursorColor: _currentColor,
          // 7
          decoration: InputDecoration(
            // 8
            hintText: _hintText,
            // 9
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
          ),
        ),
      ],
    );
  }


  Widget buildColorPicker(BuildContext context) {
    // 1
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 2
        Row(
          children: [
            Container(
              height: 50.0,
              width: 10.0,
              color: _currentColor,
            ),
            const SizedBox(width: 8.0),
            Text(
              'Color',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
          ],
        ),
        // 3
        TextButton(
          child: const Text('Select'),
          onPressed: () {
            // 4
            showDialog(
                context: context,
                builder: (context) {
                  // 5
                  return AlertDialog(
                    content: BlockPicker(
                        pickerColor: Colors.white,
                        // 6
                        onColorChanged: (color) {
                          setState(() => _currentColor = color);
                        }),
                    actions: [
                      // 7
                      TextButton(
                        child: const Text('Save'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
          },
        ),
      ],
    );
  }
}
