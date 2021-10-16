enum Complexity { Simple, Challenging, Hard }
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

// This Model contains the Ingredients and all other information
class Meal {
  final int duration;
  final String id;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> categories;
  final List<String> steps;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  const Meal(
      {this.steps,
      this.categories,
      this.duration,
      this.id,
      this.affordability,
      this.complexity,
      this.title,
      this.imageUrl,
      this.ingredients,
      this.isGlutenFree,
      this.isVegan,
      this.isVegetarian,
      this.isLactoseFree});
}
