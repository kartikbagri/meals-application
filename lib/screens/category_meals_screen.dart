import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals, {super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  bool _loadedInitiData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitiData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final String categoryId = routeArgs['id'] as String;

      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitiData = true;
    }
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle as String,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final categoryMeal = displayedMeals![index];
          return MealItem(
            id: categoryMeal.id,
            title: categoryMeal.title,
            imageUrl: categoryMeal.imageUrl,
            duration: categoryMeal.duration,
            complexity: categoryMeal.complexity,
            affordability: categoryMeal.affordability,
          );
        },
        itemCount: displayedMeals?.length,
      ),
    );
  }
}
