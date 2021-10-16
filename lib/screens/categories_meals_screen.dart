import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/models/catagories_meals_screen_model.dart';
import '../DummyList.dart';
import '../widgets/show_meals_data.dart';

class CategoriesMealsScreen extends StatefulWidget {
  final List availableList;
  CategoriesMealsScreen(this.availableList);
  static String categoriesMealsScreen = '/categories-meals';

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  List<Meal> mealDetails;
  String categoryTitle;
  bool checkItemRemove = false;
  @override
  void initState() {
    ///..../
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!checkItemRemove) {
      var routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final mealId = routeArgs['id'];
      mealDetails = widget.availableList
          .where((element) => element.categories.contains(mealId))
          .toList();
      checkItemRemove = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    void removeItem(String id) {
      setState(() {
        mealDetails.removeWhere((element) => element.id == id);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Center(
            child: MealsDataShow(
              id: mealDetails[index].id,
              ingredientsOfMeal: mealDetails[index].ingredients,
              duration: mealDetails[index].duration,
              imageUrl: mealDetails[index].imageUrl,
              title: mealDetails[index].title,
              affordability: mealDetails[index].affordability,
              complexity: mealDetails[index].complexity,
            ),
          );
        },
        itemCount: mealDetails.length,
      ),
    );
  }
}
