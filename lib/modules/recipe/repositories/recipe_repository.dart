import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_recipes_app/modules/recipes/models/recipes_model.dart';

class RecipeRepository {
  RecipeRepository();

  CollectionReference recipes =
      FirebaseFirestore.instance.collection("Recipes");

  Future getRecipeById(String documentId) {
    return recipes.doc(documentId).get();
  }

  Future getRecipeByName(String recipeName) {
    return recipes.where("recipeName", isEqualTo: recipeName).limit(1).get();
  }

  Future<void> updateRecipe(String documentId, Recipe model) {
    return recipes
        .doc(documentId)
        .update({
          "recipeName": model.recipeName,
          "calories": model.calories,
          "ingredients": model.ingredients,
          "instructions": model.instructions,
          "noOfServings": model.noOfServings,
          "nutritions": model.nutritions,
          "totalTime": model.totalTime
        })
        .then((value) => print("SUCCESS"))
        .catchError((error) => print("FAILED: $error"));
  }

  Future<void> deleteRecipe(String documentId) {
    return recipes
        .doc(documentId)
        .delete()
        .then((value) => print("SUCCESS"))
        .catchError((error) => print("FAILED: $error"));
  }

  void changeRecipeByRecipeId(String action, Recipe model) {
    String recipeId = model.recipeId;
    recipes.get().then((snapshot) {
      List<DocumentSnapshot> allDocs = snapshot.docs.toList();
      for (DocumentSnapshot ds in allDocs) {
        String current = ds.get("recipeId");
        if (current == recipeId) {
          if (action == "DELETE") {
            deleteRecipe(ds.id);
          } else if (action == "UPDATE") {
            updateRecipe(ds.id, model);
          }
        }
      }
    });
  }
}
