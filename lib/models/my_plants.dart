class MyPlant {
  final String plantId;
  final String imageURL;
  final String size;
  final String plantName;

  MyPlant({
    required this.plantId,
    required this.imageURL,
    required this.plantName,
    required this.size,
  });

  static List<MyPlant> myPlantList = [
    MyPlant(plantId: '0', imageURL: 'assets/images/rose.jpeg', plantName: 'Rose', size: '15 cm'),
    MyPlant(plantId: '1', imageURL: 'assets/images/cactus.jpeg', plantName: 'Cactus',size: '6 cm'),
    MyPlant(plantId: '2', imageURL: 'assets/images/violet.jpeg', plantName: 'Violet',size: '8 cm'),
  ];

}
