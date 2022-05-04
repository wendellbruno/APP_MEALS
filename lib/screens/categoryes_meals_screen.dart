import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesMaelsScreen extends StatelessWidget {
  final List<Meal> meals;
  const CategoriesMaelsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    // se o id da categoria(comida) for igual ao id categoria ele é selecionado
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.builder(
              itemCount: categoryMeals.length,
              itemBuilder: (context, index) {
                return MealItem(categoryMeals[index]);
              })),
    );
  }
}
