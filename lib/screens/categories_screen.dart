import 'package:flutter/material.dart';

import '../DummyList.dart';
import '../widgets/category_item_view.dart';

class CategoriesScreen extends StatelessWidget {
  static String categoriesScreen = '/categories-meals';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GridView(
          children: dummyList
              .map(
                (e) => CategoryItemView(
                  e.title,
                  e.color,
                  e.id,
                ),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 170,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1.7)),
    );
  }
}
