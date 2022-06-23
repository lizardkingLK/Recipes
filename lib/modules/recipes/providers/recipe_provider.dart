import 'package:flutter/cupertino.dart';
import 'package:food_recipes_app/modules/recipes/models/recipes_model.dart';
import 'package:food_recipes_app/utils/services/database_service.dart';
import 'package:uuid/uuid.dart';

class RecipeProvider with ChangeNotifier {
  final databaseService = DatabaseService();

  String _recipeId;
  String _recipeName;
  int _noOfServings;
  // File image;
  String _totalTime;
  String _ingredients;
  String _nutritions;
  int _calories;
  String _instructions;
  var uuid = Uuid();

  //getters
  String get recipeId => _recipeId;
  String get recipeName => _recipeName;
  int get noOfServings => _noOfServings;
  // File image;
  String get totalTime => _totalTime;
  String get ingredients => _ingredients;
  String get nutritions => _nutritions;
  int get calories => _calories;
  String get instructions => _instructions;
  Stream<List<Recipe>> get recipes => databaseService.viewRecipes();

  //setters
  set changeRecipeName(String recipeName) {
    _recipeName = recipeName;
    notifyListeners();
  }

  set changeNoOfServings(int noOfServings) {
    _noOfServings = noOfServings;
    notifyListeners();
  }

  set changeTotalTime(String totalTime) {
    _totalTime = totalTime;
    notifyListeners();
  }

  set changeIngredients(String ingredients) {
    _ingredients = ingredients;
    notifyListeners();
  }

  set changeNutritions(String nutritions) {
    _nutritions = nutritions;
    notifyListeners();
  }

  set changeCalories(int calories) {
    _calories = calories;
    notifyListeners();
  }

  set changeInstructions(String instructions) {
    _instructions = instructions;
    notifyListeners();
  }

  // loadRecipes(Recipe recipe) {
  //   if (recipe != null) {
  //     _recipeName = recipe.recipeName;
  //     _noOfServings = recipe.noOfServings.toInt();
  //     _totalTime = recipe.totalTime;
  //     _ingredients = recipe.ingredients;
  //     _nutritions = recipe.nutritions;
  //     _calories = recipe.calories.toInt();
  //     _instructions = recipe.instructions;
  //   } else {
  //     _recipeName = null;
  //     _noOfServings = null;
  //     _totalTime = null;
  //     _ingredients = null;
  //     _nutritions = null;
  //     _calories = null;
  //     _instructions = null;
  //   }
  // }

  saveRecipe() {
    var newRecipe = Recipe(
        recipeId: uuid.v1(),
        recipeName: _recipeName,
        noOfServings: _noOfServings.toInt(),
        totalTime: _totalTime,
        ingredients: _ingredients,
        nutritions: _nutritions,
        calories: _calories.toInt(),
        instructions: _instructions);

    databaseService.addRecipe(newRecipe);
  }
}
