import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_recipes_app/core/auth/login/login_screen.dart';
import 'package:food_recipes_app/core/auth/register/register_screen.dart';
import 'package:food_recipes_app/core/auth/welcome/welcome_screen.dart';
import 'package:food_recipes_app/modules/recipe/screens/recipe_screen.dart';
import 'package:food_recipes_app/modules/recipes/models/recipes_model.dart';
import 'package:food_recipes_app/modules/recipes/screens/add_recipe_screen.dart';
import 'package:food_recipes_app/modules/recipes/screens/recipes_screen.dart';
import 'package:food_recipes_app/modules/recipe/screens/edit_recipe_screen.dart';
import 'package:food_recipes_app/utils/ui/ui_utils.dart';
import 'package:food_recipes_app/widgets/img_picker.dart';

var welcomeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return WelcomeScreen();
});

var registerHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return RegisterScreen();
});

var loginHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return LoginScreen();
});

var homeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return HomeScreen();
});

var addRecipeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return AddRecipeScreen();
});

var recipeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  final Recipe recipe = ModalRoute.of(context).settings.arguments;
  return RecipeScreen(recipe);
});

var editRecipeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  final Recipe recipe = ModalRoute.of(context).settings.arguments;
  return EditRecipeScreen(recipe);
});

var cameraWidgetHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ImageChooser();
});

var errorHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ErrorScreen();
});

var connectionErrorHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ConnectionErrorScreen();
});
