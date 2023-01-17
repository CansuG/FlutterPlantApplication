import 'package:flutter/material.dart';
import 'package:plant_app/models/plant_model.dart';
import 'package:provider/provider.dart';

import '../components/my_plant_widget.dart';
import 'my_plant_item_screen.dart';

class MyPlantListPage extends StatelessWidget {
  const MyPlantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyPlantModel>(
      builder:(context, model, child){
        return Padding(
          padding: const EdgeInsets.all(16.0),

          child: ListView.separated(

            itemCount: model.plantItems.length,
            itemBuilder: (context, index) {
              final item = model.plantItems[index];

              return Selector<MyPlantModel, model>(
                  builder: (context, model, child){

                  },selector: (context, model) => ,
                Dismissible(

                key: Key(item.plantId),

                direction: DismissDirection.endToStart,

                background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: const Icon(Icons.delete_forever,
                        color: Colors.white, size: 50.0)),

                onDismissed: (direction) {

                  Provider.of<MyPlantModel>(context, listen:false).deleteItem(index);

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.plantName} dismissed')));
                },
                child: InkWell(
                  child: MyPlantWidget(
                    key: Key(item.plantId),
                    item: item,
                    onWatered: (change) {
                      if (change != null) {
                        Provider.of<MyPlantModel>(context, listen:false).wateredItem(index, change);
                      }
                    },
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddMyPlantScreen(
                          originalItem: item,

                          onUpdate: (item) {

                            Provider.of<MyPlantModel>(context, listen:false).updateItem(item, index);

                            Navigator.pop(context);
                          },

                          onCreate: (item) {},
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            // 8
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16.0);
            },
          ),
        );
      }
    );
  }
}
