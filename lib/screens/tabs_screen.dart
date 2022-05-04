import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectScreenIndex = 0;
  late List<Widget> _screens;

  // a lista de tela representa a sequencia de naegação pelos icones
  @override
  void initState() {
    super.initState();

    _screens = [
      const CategoriesScreen(),
      FavoriteScreen(widget.favoriteMeals),
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos cozinhar'),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectScreenIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favoritos',
            ),
          ]),
    );
  }
}
