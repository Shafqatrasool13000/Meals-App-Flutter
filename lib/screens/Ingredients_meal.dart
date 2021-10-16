import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import '../DummyList.dart';

class IngredientsOfMeals extends StatefulWidget {
  static const String ingredientsOfMeals = '/Ingredients-Meals';
  final Function togglesMeals;
  final Function checkFavourite;
  IngredientsOfMeals(this.checkFavourite, this.togglesMeals);

  @override
  _IngredientsOfMealsState createState() => _IngredientsOfMealsState();
}

class _IngredientsOfMealsState extends State<IngredientsOfMeals> {
  Widget selectedMealDetails(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        '$title',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget showMealDetails(Widget child) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      height: 130,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    //This is ued to take Argument like e.g Id from the previous Screen
    final mealsIngredientsId =
        ModalRoute.of(context).settings.arguments as String;
    //It is ued to take Some Information From the Dummy List Like e.g Steps and Ingredients
    final mealsDetails =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealsIngredientsId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${mealsDetails.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  '${mealsDetails.imageUrl}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            selectedMealDetails(context, 'Ingredients'),
            showMealDetails(
              ListView.builder(
                  itemCount: mealsDetails.ingredients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 6.0,
                      color: Theme.of(context).accentColor,
                      child: Text('${mealsDetails.ingredients[index]}'),
                    );
                  }),
            ),
            selectedMealDetails(context, 'Steps'),
            showMealDetails(ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text('# ${mealsDetails.steps[index]}'),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: mealsDetails.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(widget.checkFavourite(mealsIngredientsId)
              ? Icons.star
              : Icons.star_border),
          onPressed: () => widget.togglesMeals(mealsIngredientsId)),
    );
  }
}
