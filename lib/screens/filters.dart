import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _gultenFreeFilterSet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Your Filter'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _gultenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _gultenFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Gulten Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:const EdgeInsets.only(
              left: 30,
              right: 22,
            ),
          ),
        ],
      ),
    );
  }
}