class MyPlant {
  final String plantId;
  final String? size;
  final String plantName;
  final String? myPlantName;
  final String? description;
  final bool isWatered;

  MyPlant({
    required this.plantId,
    required this.plantName,
    this.myPlantName,
    this.size,
    this.description,
    this.isWatered = false,
  });

  MyPlant copyWith({
    String? plantId,
    String? size,
    String? plantName,
    String? myPlantName,
    String? description,
    bool? isWatered,
  }) {
    return MyPlant(
        plantId: plantId ?? this.plantId,
        size: size ?? this.size,
        plantName: plantName ?? this.plantName,
        myPlantName: myPlantName ?? this.myPlantName,
        description: description ?? this.description,
        isWatered: isWatered?? this.isWatered);
  }
}
