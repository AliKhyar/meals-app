import 'package:flutter/material.dart';
import 'package:meals_app/data/app_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  //########### ingredients and steps title
  Widget titleWidget(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  //########## for the ingredients items and the steps
  Widget ingredientsStepsContainer(context, child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red[900]),
        ),
        height: 160,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == routesArgs['id']);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          routesArgs['id'],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            titleWidget(context, 'Ingredients'),
            ingredientsStepsContainer(
              context,
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.green[300],
                  child: Text(
                    selectedMeal.ingredients[index],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            titleWidget(context, 'Steps'),
            ingredientsStepsContainer(
              context,
              ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) => Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('${index + 1}'),
                            ),
                            title: Text(
                              selectedMeal.steps[index],
                            ),
                          ),
                          Divider(),
                        ],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
