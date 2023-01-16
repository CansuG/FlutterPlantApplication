class Plant {
  final int plantID;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorited;
  final String description;
  bool isSelected;

  Plant(
      {required this.plantID,
      required this.price,
      required this.category,
      required this.plantName,
      required this.size,
      required this.rating,
      required this.humidity,
      required this.temperature,
      required this.imageURL,
      required this.isFavorited,
      required this.description,
      required this.isSelected});

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
        plantID: 0,
        price: 22,
        category: 'Indoor',
        plantName: 'Sanseviera',
        size: 'Small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        imageURL: 'assets/images/plant-one.png',
        isFavorited: false,
        description:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantID: 1,
        price: 11,
        category: 'Outdoor',
        plantName: 'Philodendron',
        size: 'Medium',
        rating: 4.8,
        humidity: 56,
        temperature: '19 - 22',
        imageURL: 'assets/images/plant-two.png',
        isFavorited: false,
        description:
            'The foliage of philodendrons is usually green but may be coppery, red, or purplish; parallel leaf veins are usually green or sometimes red or white.',
        isSelected: false),
    Plant(
        plantID: 2,
        price: 18,
        category: 'Indoor',
        plantName: 'Beach Daisy',
        size: 'Large',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        imageURL: 'assets/images/plant-three.png',
        isFavorited: false,
        description:
            'This plant lives in the humid tropical forests, in the lowlands and middle mountains, in the extreme south of Mexico and also in Belize, Honduras, El Salvador, Costa Rica, and Panama.',
        isSelected: false),
    Plant(
        plantID: 3,
        price: 30,
        category: 'Outdoor',
        plantName: 'Big Bluestem',
        size: 'Small',
        rating: 4.5,
        humidity: 35,
        temperature: '23 - 28',
        imageURL: 'assets/images/plant-one.png',
        isFavorited: false,
        description:
            "It is an evergreen climbing vine that typically grows to 3-6' long. As a houseplant, it is typically grown for its attractive ornamental foliage which changes shape as the leaves mature.",
        isSelected: false),
    Plant(
        plantID: 4,
        price: 24,
        category: 'Recommended',
        plantName: 'Big Bluestem',
        size: 'Large',
        rating: 4.1,
        humidity: 66,
        temperature: '12 - 16',
        imageURL: 'assets/images/plant-four.png',
        isFavorited: false,
        description:
            'An essential grass for grassland restoration and prairie gardens in the central plains. Large stature, blue-green foliage, and interesting flowering heads.',
        isSelected: false),
    Plant(
        plantID: 5,
        price: 24,
        category: 'Outdoor',
        plantName: 'Meadow Sage',
        size: 'Medium',
        rating: 4.4,
        humidity: 36,
        temperature: '15 - 18',
        imageURL: 'assets/images/plant-five.png',
        isFavorited: false,
        description:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantID: 6,
        price: 19,
        category: 'Garden',
        plantName: 'Plumbago',
        size: 'Small',
        rating: 4.2,
        humidity: 46,
        temperature: '23 - 26',
        imageURL: 'assets/images/plant-six.png',
        isFavorited: false,
        description:
            'Plumbago is a genus of 10–20 species of flowering plants in the family Plumbaginaceae, native to warm temperate to tropical regions of the world.',
        isSelected: false),
    Plant(
        plantID: 7,
        price: 23,
        category: 'Garden',
        plantName: 'Tritonia',
        size: 'Medium',
        rating: 4.5,
        humidity: 34,
        temperature: '21 - 24',
        imageURL: 'assets/images/plant-seven.png',
        isFavorited: false,
        description:
            'Tritonia are small bulbous plants up to 80 cm. It produces a fan of short, lance-shaped leaves in autumn and a spike of numerous bright fiery orange or reddish orange.',
        isSelected: false),
    Plant(
        plantID: 8,
        price: 46,
        category: 'Recommended',
        plantName: 'Tritonia',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/plant-eight.png',
        isFavorited: false,
        description:
            'Tritonia crocata is a striking, late spring and early summer-flowering plant with fiery orange or reddish orange flower sprays and a fan of short, lance-shaped leaves.',
        isSelected: false),
  ];
}
