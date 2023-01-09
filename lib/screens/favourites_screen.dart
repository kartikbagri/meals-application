import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  const FavouritesScreen(this.favouriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return const Center(
        child: Text('No favourites added yet! Add some of your choice!'),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        final categoryMeal = favouriteMeals[index];
        return MealItem(
          id: categoryMeal.id,
          title: categoryMeal.title,
          imageUrl: categoryMeal.imageUrl,
          duration: categoryMeal.duration,
          complexity: categoryMeal.complexity,
          affordability: categoryMeal.affordability,
        );
      },
      itemCount: favouriteMeals.length,
    );
  }
}
