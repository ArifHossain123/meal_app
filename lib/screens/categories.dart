import 'package:flutter/material.dart';
import 'package:meal_app/data/data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void _selectCategory(
    BuildContext context,
    Category category,
  ) {
    final filterMeals = meals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filterMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        //availableCategories.map((category) => CategoryGridItem(category: category)),
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(
                context,
                category,
              );
            },
          ),
      ],
    );
  }
}
