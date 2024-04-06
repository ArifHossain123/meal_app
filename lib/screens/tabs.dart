import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/meals.dart';

class TabsScreeen extends StatefulWidget {
  const TabsScreeen({super.key});
  @override
  State<TabsScreeen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreeen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _mealfavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is no Longer a FAvorite');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage('Mark as Favorite Meal');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onFavorite: _mealfavoriteStatus,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onFavorite: _mealfavoriteStatus,
      );
      activePageTitle = 'Your Favorite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: Drawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.set_meal,
              ),
              label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite"),
        ],
      ),
    );
  }
}
