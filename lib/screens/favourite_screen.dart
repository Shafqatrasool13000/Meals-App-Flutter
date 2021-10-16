import 'package:flutter/material.dart';
import 'package:mealsapp/screens/tab_screen.dart';
import 'package:mealsapp/models/catagories_meals_screen_model.dart';
import 'package:mealsapp/widgets/show_meals_data.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);
  static const favouriteScreen = 'favourite-Screen';

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('Favourites are not yet added Add some favourite to see'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealsDataShow(
            id: favouriteMeals[index].id,
            ingredientsOfMeal: favouriteMeals[index].ingredients,
            duration: favouriteMeals[index].duration,
            imageUrl: favouriteMeals[index].imageUrl,
            title: favouriteMeals[index].title,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
