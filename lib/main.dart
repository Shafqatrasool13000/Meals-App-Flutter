import 'package:flutter/material.dart';
import 'package:mealsapp/DummyList.dart';
import 'package:mealsapp/models/catagories_meals_screen_model.dart';
import 'package:mealsapp/screens/categories_screen.dart';
import 'package:mealsapp/screens/favourite_screen.dart';
import './screens/filters_screen.dart';
import './screens/tab_screen.dart';

import './screens/categories_meals_screen.dart';
import './screens/Ingredients_meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _favouriteMeals = [];
  List<Meal> _isAvailableList = DUMMY_MEALS;

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  void _setFilters(Map<String, bool> getFilters) {
    _isAvailableList = DUMMY_MEALS.where((element) {
      if (_filters['gluten'] && !element.isGlutenFree) {
        return false;
      }
      if (_filters['lactose'] && !element.isLactoseFree) {
        return false;
      }
      if (_filters['vegetarian'] && !element.isVegetarian) {
        return false;
      }
      if (_filters['vegan'] && !element.isVegan) {
        return false;
      }
      return true;
    }).toList();
    _filters = getFilters;
  }

  void _toggleMeals(String id) {
    final existingIndex =
        _favouriteMeals.indexWhere((element) => element.id == id);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      _favouriteMeals.add(
        DUMMY_MEALS.firstWhere((element) => element.id == id),
      );
    }
  }

  bool _checkFavorite(String id) {
    return _favouriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(
                headline6: TextStyle(
                    fontFamily: 'Roboto Condensed',
                    fontWeight: FontWeight.bold,
                    fontSize: 26))),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'Roboto Condensed',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontFamily: 'Roboto Condensed'),
              bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontFamily: 'Roboto Condensed'),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favouriteMeals),
        CategoriesMealsScreen.categoriesMealsScreen: (context) =>
            CategoriesMealsScreen(_isAvailableList),
        IngredientsOfMeals.ingredientsOfMeals: (context) =>
            IngredientsOfMeals(_checkFavorite, _toggleMeals),
        FiltersScreen.filterScreen: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
