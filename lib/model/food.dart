final String tableFood = 'foods';

class FoodFields {
  static final List<String> values = [
    /// Add all fields
    id, name, price
  ];
  // ignore: prefer_const_declarations
  static final String id = '_id';
  // ignore: prefer_const_declarations
  static final String name = "name";
  // ignore: prefer_const_declarations
  static final String price = "price";
}

class Food {
  final int? id;
  final String name;
  final int price;

  const Food({this.id, required this.name, required this.price});

  Food copy({int? id, String? name, int? price}) => Food(
      id: id ?? this.id, name: name ?? this.name, price: price ?? this.price);

  static Food fromJson(Map<String, Object?> json) => Food(
        id: json[FoodFields.id] as int?,
        name: json[FoodFields.name] as String,
        price: json[FoodFields.price] as int,
      );

  Map<String, Object?> toJson() =>
      {FoodFields.id: id, FoodFields.name: name, FoodFields.price: price};
}
