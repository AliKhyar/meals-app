import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';

import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealsApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.yellow,
        canvasColor: Color.fromARGB(232,232,250, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromARGB(250, 10, 10, 1),
              ),
              body2: TextStyle(
                color: Color.fromARGB(232, 232, 232, 1),
              ),
              title: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: CategoriesScreen(),
      //initialRoute: '/',
      routes: {
        //'/': (context) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx)=> CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx)=> MealDetailScreen(),
      },
      onGenerateRoute: (settings){
        return MaterialPageRoute(builder: (context)=>CategoriesScreen());
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context)=>CategoriesScreen());
      },
    );
  }
}
