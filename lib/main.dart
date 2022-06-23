import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:food_recipes_app/config/routes/routes.dart';
import 'package:food_recipes_app/config/routes/routes_config.dart';
import 'package:food_recipes_app/config/themes/light_theme.dart';
import 'package:food_recipes_app/config/themes/dark_theme.dart';
import 'package:food_recipes_app/modules/recipes/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  defineRoutes(router);
  runApp(Application());
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  var brightness;
  bool _isDark;

  _ApplicationState() {
    brightness = SchedulerBinding.instance.window.platformBrightness;
    this._isDark = brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeProvider(),
      child: MaterialApp(
        initialRoute: "welcome",
        onGenerateRoute: router.generator,
        title: 'Food Recipes App',
        darkTheme: dark,
        theme: _isDark ? dark : light,
        themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}
