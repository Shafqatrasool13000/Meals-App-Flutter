import 'package:flutter/material.dart';
import 'package:mealsapp/screens/Ingredients_meal.dart';

import '../models/catagories_meals_screen_model.dart';

class MealsDataShow extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final List ingredientsOfMeal;

  MealsDataShow(
      {@required this.id,
      @required this.ingredientsOfMeal,
      @required this.complexity,
      @required this.title,
      @required this.affordability,
      @required this.imageUrl,
      @required this.duration});
  //It is Used to show Complexity enum to human Readable
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        {
          return 'unknown';
        }
    }
  }

  //It is Used to show Affordability enum to human Readable
  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        {
          return 'unknown';
        }
    }
  }

  //It makes The user to move to Ingredients Screen
  void showIngredientsScreen(BuildContext context) {
    Navigator.pushNamed(context, IngredientsOfMeals.ingredientsOfMeals,
            arguments: id)
        .then((value) {
      if (value != null) {
        //removeItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showIngredientsScreen(context),
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    width: 250,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.watch_later),
                      SizedBox(
                        width: 10,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 10,
                      ),
                      Text('$complexityText'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 10,
                      ),
                      Text('$affordabilityText'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
