import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';

import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  const FavoriteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return const Center(
        child: Text('Nenhuma refeição foi marcada como favorita !'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeal.length,
        itemBuilder: (context, index) {
          return MealItem(favoriteMeal[index]);
        },
      );
    }
  }
}
