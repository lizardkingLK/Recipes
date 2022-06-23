import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/config/themes/theme_config.dart';
import 'package:food_recipes_app/modules/recipe/screens/sections/recipe_section.dart';
import 'package:food_recipes_app/modules/recipes/models/recipes_model.dart';

// ignore: must_be_immutable
class RecipeScreen extends StatefulWidget {
  Recipe recipe;

  RecipeScreen(this.recipe, {Key key}) : super(key: key);

  @override
  _RecipeScreenState createState() => _RecipeScreenState(recipe);
}

class _RecipeScreenState extends State<RecipeScreen> {
  Recipe _recipe;

  _RecipeScreenState(Recipe recipe) {
    this._recipe = recipe;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe"),
      ),
      drawer: Drawer(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration:
                      BoxDecoration(color: Theme.of(context).backgroundColor),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.ramen_dining),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Recepiis",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        )
                      ])),
              ListTile(
                title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "home");
                },
              ),
              ListTile(
                title: Text("Settings"),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Sign Out"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "login");
                },
              ),
              ThemeConfig()
            ],
          ),
        ),
      ),
      //
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              this._recipe.recipeName,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Row(children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Icon(Icons.local_dining),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      "${this._recipe.noOfServings} Servings",
                      style: Theme.of(context).textTheme.bodyText2,
                    ))
              ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(Icons.bolt),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text(
                        "${this._recipe.calories} Calories",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(Icons.timer),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text(
                        "${this._recipe.totalTime}",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Divider(
              height: 10,
              thickness: 2,
            ),
          ),
          RecipeSection("Ingredients", ",", Icons.brunch_dining,
              this._recipe.ingredients),
          RecipeSection("Instructions", ".", Icons.note_alt_outlined,
              this._recipe.instructions),
          RecipeSection(
              "Nutritions", ",", Icons.ramen_dining, this._recipe.nutritions),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, "editRecipe", arguments: this._recipe),
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
