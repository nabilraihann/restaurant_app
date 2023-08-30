import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) => Restaurant(
      id: restaurant["id"],
      name: restaurant["name"],
      description: restaurant["description"],
      pictureId: restaurant["pictureId"],
      city: restaurant["city"],
      rating: restaurant["rating"]?.toDouble());
}

// class Menus {
//   final List<Food> foods;
//   final List<Drink> drinks;
//
//   Menus({
//     required this.foods,
//     required this.drinks,
//   });
// }
//
// class Food {
//   final String name;
//
//   Food({
//     required this.name;
//   });
// }
//
// class Drink {
//   final String name;
//
//   Drink({
//     required this.name,
//   });
// }

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
