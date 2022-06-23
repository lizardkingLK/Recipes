import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Recipe {
  String recipeId;
  String recipeName;
  int noOfServings;

  // String image;
  String totalTime;
  String ingredients;
  String nutritions;
  int calories;
  String instructions;

  Recipe(
      {@required this.recipeId,
      @required this.recipeName,
      @required this.noOfServings,
      @required this.totalTime,
      @required this.ingredients,
      this.nutritions,
      this.calories,
      @required this.instructions});

  DocumentReference documentReference;

  Recipe.fromMap(Map<String, dynamic> map, {this.documentReference}) {
    recipeId = map["recipeId"];
    recipeName = map["recipeName"];
    noOfServings = map["noOfServings"];
    totalTime = map["totalTime"];
    ingredients = map["ingredients"];
    nutritions = map["nutritions"];
    calories = map["calories"];
    instructions = map["instructions"];
  }

  Recipe.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), documentReference: snapshot.reference);

  toJson() {
    return {
      'recipeId': recipeId,
      'recipeName': recipeName,
      'noOfServings': noOfServings,
      'totalTime': totalTime,
      'ingredients': ingredients,
      'nutritions': nutritions,
      'calories': calories,
      'instructions': instructions
    };
  }

// -----------------------------------------------------------

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        recipeId: json['recipeId'],
        recipeName: json['recipeName'],
        noOfServings: json['noOfServings'],
        totalTime: json['totalTime'],
        ingredients: json['ingredients'],
        nutritions: json['nutritions'],
        calories: json['calories'],
        instructions: json['instructions']);
  }

  Map<String, dynamic> toMap() {
    return {
      'recipeId': recipeId,
      'recipeName': recipeName,
      'noOfServings': noOfServings,
      'totalTime': totalTime,
      'ingredients': ingredients,
      'nutritions': nutritions,
      'calories': calories,
      'instructions': instructions
    };
  }

  @override
  String toString() {
    return "recipeId: $recipeId," +
        "recipeName: $recipeName," +
        "noOfServings: $noOfServings," +
        //"image: $image," +
        "totalTime: $totalTime," +
        "ingredients: $ingredients," +
        "nutritions: $nutritions," +
        "calories: $calories," +
        "instructions: $instructions";
  }
}
