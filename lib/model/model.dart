class Asbeza {
  String foodTitle;
  String foodDescription;
  String image;
  num foodPrice;

  Asbeza(
      {required this.foodTitle,
      required this.foodDescription,
      required this.foodPrice,
      required this.image});

  factory Asbeza.fromJson(Map<String, dynamic> parsedJson) {
    return Asbeza(
        foodTitle: parsedJson["title"],
        foodDescription: parsedJson["description"],
        foodPrice: parsedJson["price"],
        image: parsedJson["image"]);
  }

  static List asbezaList(List asbeza) {
    List asbezas = [];
    for (var i = 0; i < asbeza.length; i++) {
      asbezas.add(Asbeza.fromJson(asbeza[i]));
    }
    return asbezas;
  }
}
