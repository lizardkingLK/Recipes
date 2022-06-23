import 'package:flutter/material.dart';
import 'package:food_recipes_app/modules/recipes/models/recipes_model.dart';
import 'package:food_recipes_app/modules/recipes/providers/recipe_provider.dart';
// import 'package:food_recipes_app/widgets/img_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddRecipeScreen extends StatefulWidget {
  final Recipe recipe;

  AddRecipeScreen({this.recipe});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  static final Color darkGrey = Color(0xFF2C384A);
  static final Color lightGrey = Color(0xFFECEFF1);
  static final Color grey1 = Color(0xFF708090);
  static final Color grey2 = Color(0xFFD3D3D3);
  static final Color red1 = Color(0xFFDC143C);

  final recipeNameController = TextEditingController();
  final noOfServingsController = TextEditingController();
  final totalTimeController = TextEditingController();
  final ingredientsController = TextEditingController();
  final nutritionsController = TextEditingController();
  final caloriesController = TextEditingController();
  final instructionsController = TextEditingController();

  PickedFile imageFile;

  @override
  void dispose() {
    recipeNameController.dispose();
    noOfServingsController.dispose();
    totalTimeController.dispose();
    ingredientsController.dispose();
    nutritionsController.dispose();
    caloriesController.dispose();
    instructionsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
        backgroundColor: darkGrey,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Add Recipe",
              style: TextStyle(
                color: red1,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )),
          backgroundColor: darkGrey,
        ),
        body: ListView(
          children: [
            Container(
                child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 19, 22, 5),
                      child: Text('Recipe Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: lightGrey),
                          textAlign: TextAlign.left)),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 0, 22, 5),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey1, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey2, width: 2.0))),
                        onChanged: (String value) =>
                            recipeProvider.changeRecipeName = value,
                        controller: recipeNameController,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 15, 22, 5),
                      child: Text('Number of Servings',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: lightGrey))),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 0, 22, 5),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey1, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey2, width: 2.0))),
                        onChanged: (String value) => recipeProvider
                            .changeNoOfServings = int.parse(value),
                        controller: noOfServingsController,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 15, 22, 5),
                      child: Text('Total Time',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: lightGrey))),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 0, 22, 5),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey1, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey2, width: 2.0))),
                        onChanged: (String value) =>
                            recipeProvider.changeTotalTime = value,
                        controller: totalTimeController,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 15, 22, 5),
                      child: Text('Ingredients',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: lightGrey))),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 0, 22, 5),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey1, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey2, width: 2.0))),
                        onChanged: (String value) =>
                            recipeProvider.changeIngredients = value,
                        controller: ingredientsController,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 15, 22, 5),
                      child: Text('Nutritions',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: lightGrey))),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 0, 22, 5),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey1, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey2, width: 2.0))),
                        onChanged: (String value) =>
                            recipeProvider.changeNutritions = value,
                        controller: nutritionsController,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 15, 22, 5),
                      child: Text('Calories',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: lightGrey))),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 0, 22, 5),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey1, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey2, width: 2.0))),
                        onChanged: (String value) =>
                            recipeProvider.changeCalories = int.parse(value),
                        controller: caloriesController,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 15, 22, 5),
                      child: Text('Instructions',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: lightGrey))),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(22, 0, 22, 5),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey1, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: grey2, width: 2.0))),
                        onChanged: (String value) =>
                            recipeProvider.changeInstructions = value,
                        controller: instructionsController,
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(30),
                          child: ElevatedButton(
                            child: Text("Add Image"),
                            onPressed: () {
                              Navigator.pushNamed(context, "img");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(30),
                          child: ElevatedButton(
                            child: Text("Add"),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                recipeProvider.saveRecipe();
                                Navigator.pushNamed(context, "home");
                              }
                            },
                          ),
                        )
                      ]),
                ],
              ),
            ))
          ],
        ));
  }
}
