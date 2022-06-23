import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/constants/assets_path.dart';
import 'package:food_recipes_app/modules/recipes/models/recipes_model.dart';
import 'package:food_recipes_app/modules/recipes/providers/recipe_provider.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String username = "Vanessa";
  static final Color darkGrey = Color(0xFF2C384A);
  static final Color lightGrey = Color(0xFFECEFF1);
  static final Color grey1 = Color(0xFF708090);
  static final Color grey2 = Color(0xFFD3D3D3);
  static final Color red1 = Color(0xFFDC143C);
  static final Color red2 = Color(0xFFE34234);
  static final Color red3 = Color(0xFF9A2A2A);

  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      backgroundColor: darkGrey,
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi $username",
                    style: TextStyle(fontSize: 25, color: lightGrey),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: red1,
                              style: BorderStyle.solid,
                              width: 4.0))),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Make Your Day By, Simply',
                              style: TextStyle(fontSize: 18.0, color: grey2)),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text('Finding Recipes',
                                style: TextStyle(fontSize: 19.0, color: grey2)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: Container(
                              height: 75.0,
                              width: 75.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: AssetImage(IMAGE_ASSET_foody),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Divider(
                  height: 5,
                  thickness: 1,
                  color: grey1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Row(children: [
                      Text(
                        "Recipes",
                        style: TextStyle(
                            fontSize: 25.0,
                            color: grey2,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                    child: Ink(
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.list_alt),
                        iconSize: 30,
                        color: red2,
                        onPressed: () {
                          Navigator.pushNamed(context, "home");
                        },
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: StreamBuilder<List<Recipe>>(
                    stream: recipeProvider.recipes,
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return
                                  // index == 0
                                  //     ? search()
                                  //     :
                                  Padding(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                child: Card(
                                    color: grey1,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 5, 15, 0),
                                      child: Column(
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 9, 0, 0),
                                                  child: Text(
                                                    snapshot
                                                        .data[index].recipeName,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 19.0,
                                                        color: lightGrey,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 5, 0, 0),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        WidgetSpan(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        2.0),
                                                            child: Icon(
                                                              Icons
                                                                  .people_alt_outlined,
                                                              size: 20,
                                                              color: red3,
                                                            ),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                            text: "  " +
                                                                snapshot
                                                                    .data[index]
                                                                    .noOfServings
                                                                    .toString() +
                                                                " Servings",
                                                            style: TextStyle(
                                                                fontSize: 16.0,
                                                                color: grey2)),
                                                      ],
                                                    ),
                                                  )),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 7, 0, 10),
                                                child: Container(
                                                  height: 33.0,
                                                  width: 73.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    color: red1,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                        snapshot.data[index]
                                                            .totalTime,
                                                        style: TextStyle(
                                                            fontSize: 12.0,
                                                            color: grey2)),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      167, 0, 0, 0),
                                                  child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context, "recipe",
                                                            arguments: new Recipe(
                                                                ingredients: snapshot
                                                                    .data[index]
                                                                    .ingredients,
                                                                instructions: snapshot
                                                                    .data[index]
                                                                    .instructions,
                                                                noOfServings: snapshot
                                                                    .data[index]
                                                                    .noOfServings,
                                                                recipeName: snapshot
                                                                    .data[index]
                                                                    .recipeName,
                                                                recipeId: snapshot
                                                                    .data[index]
                                                                    .recipeId,
                                                                totalTime: snapshot
                                                                    .data[index]
                                                                    .totalTime,
                                                                calories: snapshot
                                                                    .data[index]
                                                                    .calories,
                                                                nutritions: snapshot
                                                                    .data[index]
                                                                    .nutritions));
                                                      },
                                                      child: Text(
                                                          "Read more ->",
                                                          style: TextStyle(
                                                              fontSize: 15.0,
                                                              color: grey2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))))
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            });
                      } else {
                        return Container();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "addRecipe");
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: red1,
      ),
    );
  }

  // search() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: TextField(
  //       decoration: InputDecoration(hintText: 'Search'),
  //       onChanged: (text) {
  //         text = text.toLowerCase();
  //         setState(() {
  //           final recipeProvider = Provider.of<RecipeProvider>(context);
  //           recipeProvider.recipes.where((recipe)  )
  //         });
  //       },
  //     ),
  //   );
  // }
}
