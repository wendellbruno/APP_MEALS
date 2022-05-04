import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/meal_datail_screen.dart';
import 'package:meals/screens/settings.dart';
import 'screens/categoryes_meals_screen.dart';
import 'utils/app_routes.dart';
import 'screens/tabs_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avaibleMeals = DUMMY_MEALS;
  List<Meal> _favoreteMeals = [];

  void _filtrerMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _avaibleMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegetarian &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoreteMeals.contains(meal)
          ? _favoreteMeals.remove(meal)
          : _favoreteMeals.add(meal);
    });
  }

  bool isFavorite(Meal meal) {
    return _favoreteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Releway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(_favoreteMeals),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMaelsScreen(_avaibleMeals),
        AppRoutes.MEAL_DETAIL: ((context) =>
            MealDetailScreen(_toggleFavorite, isFavorite)),
        AppRoutes.SETTINGS: ((context) =>
            SettingsScreen(settings, _filtrerMeals)),
      },
    );
  }
}
