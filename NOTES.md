MODELS

__User__
* has_one author
* has_one reader

__Author__
* has_many recipes
* belongs_to user

__Reader__
* has_many bookmarks
* has_many views
* belongs_to user
* has_many recipes through bookmarks

__Recipe__
* belongs_to user
* has_many bookmarks
* has_many views
* has_many recipe_ingredients
* has_many ingredients through recipe_ingredients

__Ingredient__
* belongs_to recipe
* has_many recipe_ingredients
* has_many recipes through recipe_ingredients

__RecipeIngredient__
* belongs_to recipe
* belongs_to ingredient

