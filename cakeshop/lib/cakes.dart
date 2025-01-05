// ignore: file_names
class Cake {
  String name;
  String ingredients;
  String recipe;

  Cake({required this.name, required this.ingredients, required this.recipe});

  // Factory constructor to convert JSON response into Cake object
  factory Cake.fromJson(Map<String, dynamic> json) {
    return Cake(
      name: json['cake_name'],
      ingredients: json['cake_ingredients'],
      recipe: json['cake_recipe'],
    );
  }
}
