import 'package:fluro/fluro.dart';
import 'package:food_recipes_app/config/routes/routes_handler.dart';

void defineRoutes(FluroRouter router) {
  router.define("welcome",
      handler: welcomeHandler, transitionType: TransitionType.fadeIn);
  router.define("signup",
      handler: registerHandler, transitionType: TransitionType.fadeIn);
  router.define("login",
      handler: loginHandler, transitionType: TransitionType.fadeIn);
  router.define("home",
      handler: homeHandler, transitionType: TransitionType.inFromLeft);
  router.define("addRecipe",
      handler: addRecipeHandler, transitionType: TransitionType.inFromBottom);
  router.define("recipe",
      handler: recipeHandler, transitionType: TransitionType.fadeIn);
  router.define("editRecipe",
      handler: editRecipeHandler, transitionType: TransitionType.inFromBottom);
  router.define("img",
      handler: cameraWidgetHandler, transitionType: TransitionType.inFromRight);
  router.define("error",
      handler: errorHandler, transitionType: TransitionType.inFromRight);
  router.define("connectionError",
      handler: connectionErrorHandler,
      transitionType: TransitionType.inFromRight);
}
