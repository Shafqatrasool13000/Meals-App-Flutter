import 'package:flutter/material.dart';
import 'package:mealsapp/models/catagories_meals_screen_model.dart';
import 'package:mealsapp/screens/filters_screen.dart';
import './show_drawer_contents.dart';
import './categories_screen.dart';
import './favourite_screen.dart';
import '../DummyList.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;
  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      print(_selectedPageIndex);
    });
  }

  @override
  void initState() {
    pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouriteScreen(widget.favouriteMeals), 'title': 'Categories'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedPageIndex]['page'],
      drawer: DrawerContentShow(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(pages[_selectedPageIndex]['title']),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).accentColor,
          unselectedFontSize: 20,
          selectedFontSize: 20,
          selectedItemColor: Colors.red,
          currentIndex: _selectedPageIndex,
          onTap: _selectedPage,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).accentColor,
                title: Text('Categories'),
                icon: Icon(Icons.category)),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).accentColor,
                icon: Icon(Icons.star),
                title: Text('Favourites')),
          ]),
    );
  }
}
