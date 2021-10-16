import 'package:flutter/material.dart';
import './filters_screen.dart';

class DrawerContentShow extends StatelessWidget {
  Widget listTileShow(String title, IconData icon, Function callBack) {
    return ListTile(
      onTap: callBack,
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontFamily: 'Raleway', fontSize: 20),
      ),
      leading: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up !',
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),
          listTileShow('Meals', Icons.restaurant, () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          listTileShow('Filters', Icons.settings, () {
            Navigator.pushReplacementNamed(context, FiltersScreen.filterScreen);
          }),
        ],
      ),
    );
  }
}
