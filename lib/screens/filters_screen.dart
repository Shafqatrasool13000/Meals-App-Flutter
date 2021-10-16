import 'package:flutter/material.dart';
import './show_drawer_contents.dart';

class FiltersScreen extends StatefulWidget {
  final Map<String, bool> _currentFilters;
  final Function applyFilters;
  FiltersScreen(this._currentFilters, this.applyFilters);
  static const filterScreen = '/Filter-Screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isVegetarian = false;
  var isLactoseFree = false;
  var isVegan = false;
  @override
  void initState() {
    isGlutenFree = widget._currentFilters['gluten'];
    isVegetarian = widget._currentFilters['lactose'];
    isLactoseFree = widget._currentFilters['vegetarian'];
    isVegan = widget._currentFilters['vegan'];
    super.initState();
  }

  Widget _switch(
    String title,
    String subtitle,
    bool filterType,
    Function onPress,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: filterType,
      onChanged: onPress,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerContentShow(),
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Map<String, bool> _filters = {
                  'gluten': isGlutenFree,
                  'lactose': isVegetarian,
                  'vegetarian': isLactoseFree,
                  'vegan': isVegan,
                };
                widget.applyFilters(_filters);
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Your Selected Filters',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _switch('Gluten Free', 'Switch to  Gluten-Free', isGlutenFree,
              (newValue) {
            setState(() {
              isGlutenFree = newValue;
            });
          }),
          _switch(
            'is Vegetarian',
            'Switch to  Vegetarian-Free',
            isVegetarian,
            (newValue) {
              setState(() {
                isVegetarian = newValue;
              });
            },
          ),
          _switch(
            'isLactoseFree',
            'Switch to  isLactoseFree-Free',
            isLactoseFree,
            (newValue) {
              setState(() {
                isLactoseFree = newValue;
              });
            },
          ),
          _switch(
            'isVegan',
            'Switch to  isVegan-Free',
            isVegan,
            (newValue) {
              setState(() {
                isVegan = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
