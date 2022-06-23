import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_recipes_app/modules/recipes/models/recipes_model.dart';

class DatabaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  //add recipes
  Future<void> addRecipe(Recipe recipe) {
    return db.collection('Recipes').doc().set(recipe.toMap());
  }

  //view recipes
  Stream<List<Recipe>> viewRecipes() {
    return db.collection('Recipes').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());
  }

  // Stream<List<Recipe>> searchRecipes(String r) {
  //   return db.collection('Recipes').where(r).snapshots().map((snapshot) =>
  //       snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());
  // }
}
