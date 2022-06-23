import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/modules/recipe/repositories/recipe_repository.dart';
import 'package:food_recipes_app/modules/recipe/screens/sections/edit_recipe_section.dart';
import 'package:food_recipes_app/modules/recipes/models/recipes_model.dart';

// ignore: must_be_immutable
class EditRecipeScreen extends StatefulWidget {
  Recipe recipe;
  EditRecipeScreen(this.recipe, {Key key}) : super(key: key);
  @override
  _EditRecipeScreenState createState() => _EditRecipeScreenState(recipe);
}

class _EditRecipeScreenState extends State<EditRecipeScreen> {
  RecipeRepository _recipeRepository;
  Recipe _recipe;
  GlobalKey _formKey = GlobalKey<FormState>();

  var nameController,
      ttcController,
      nosController,
      cController,
      nController,
      ingController,
      insController;

  _EditRecipeScreenState(Recipe recipe) {
    this._recipeRepository = new RecipeRepository();
    this._recipe = recipe;
    nameController = TextEditingController(text: this._recipe.recipeName);
    nosController =
        TextEditingController(text: this._recipe.noOfServings.toString());
    ttcController = TextEditingController(text: this._recipe.totalTime);
    cController = TextEditingController(text: this._recipe.calories.toString());
    nController = TextEditingController(text: this._recipe.nutritions);
    ingController = TextEditingController(text: this._recipe.ingredients);
    insController = TextEditingController(text: this._recipe.instructions);
  }

  @override
  void dispose() {
    nameController.dispose();
    ttcController.dispose();
    nosController.dispose();
    cController.dispose();
    nController.dispose();
    ingController.dispose();
    insController.dispose();
    super.dispose();
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Recipe"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Are you sure?"),
                Text("You will not see this recipe no more."),
              ],
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: ElevatedButton(
                child: Text("Yes"),
                onPressed: () {
                  this
                      ._recipeRepository
                      .changeRecipeByRecipeId("DELETE", this._recipe);
                  Navigator.pushNamed(context, "home");
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: TextButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        );
      },
    );
  }

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      Recipe model = new Recipe(
        recipeId: this._recipe.recipeId,
        calories: int.parse((cController.text).toString()),
        ingredients: ingController.text,
        instructions: insController.text,
        nutritions: nController.text,
        noOfServings: int.parse((nosController.text).toString()),
        recipeName: nameController.text,
        totalTime: ttcController.text,
        // image: null
      );
      this._recipeRepository.changeRecipeByRecipeId("UPDATE", model);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).backgroundColor,
          content: Text(
            "Successfully Updated!",
            style: Theme.of(context).textTheme.bodyText1,
          )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).backgroundColor,
          content: Text(
            "Update Failed!",
            style: Theme.of(context).textTheme.bodyText1,
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Edit Recipe",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Back'),
          ),
        ],
      ),
      Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "Edit selected recipe",
            style: Theme.of(context).textTheme.bodyText2,
          )),
      Container(
        padding: EdgeInsets.all(10),
        child: Divider(
          height: 10,
          thickness: 2,
        ),
      ),
      Container(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  EditRecipeSection("Recipe Name", "Please enter recipe name",
                      false, false, nameController),
                  EditRecipeSection("Time to Cook (mins/hrs)",
                      "Enter time to cook", false, false, ttcController),
                  EditRecipeSection("Number of Servings",
                      "Enter number of servings", false, true, nosController),
                  EditRecipeSection("Calories", "Enter number of calories",
                      false, true, cController),
                  EditRecipeSection("Nutritions", "Please enter nutritions",
                      true, false, nController),
                  EditRecipeSection("Ingredients", "Please enter ingredients",
                      true, false, ingController),
                  EditRecipeSection("Instructions", "Please enter instructions",
                      true, false, insController),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 0, 40),
                          child: TextButton(
                            child: Text("Delete Recipe"),
                            onPressed: showMyDialog,
                          )),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 10, 30),
                        child: ElevatedButton(
                          onPressed: validateAndSave,
                          child: Text('Save'),
                        ),
                      )
                    ],
                  )
                ],
              )))
    ]));
  }
}
