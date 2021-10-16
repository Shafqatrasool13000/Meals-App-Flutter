import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';

class CategoryItemView extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryItemView(this.title, this.color, this.id);
  void showMealsCategories(BuildContext context) {
    Navigator.pushNamed(context, CategoriesScreen.categoriesScreen,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showMealsCategories(context),
      child: Container(
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        decoration: BoxDecoration(
          color: color,
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
