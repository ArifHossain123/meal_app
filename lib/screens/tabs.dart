import 'package:flutter/material.dart';

class TabsScreeen extends StatefulWidget {
  const TabsScreeen({super.key});
  @override
  State<TabsScreeen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreeen> {
  int _selectedPageIndex=0;
  void _selectPage(index){
    setState(() {
      _selectedPageIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),),
      body: ,
      bottomNavigationBar: BottomNavigationBar(onTap: (index){}, items:const [
        BottomNavigationBarItem(icon: Icon(Icons.set_meal,), label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label:"Favorite" ),
      ],),
    );
  }
  
}
