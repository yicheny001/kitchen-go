# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Reader.destroy_all
Author.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
Bookmark.destroy_all
RecipeIngredient.destroy_all
ShoppingList.destroy_all
LineItem.destroy_all
Category.destroy_all
ShoppingList.destroy_all
RecipeCategory.destroy_all
Store.destroy_all
StoreItem.destroy_all
Review.destroy_all

user_1 = User.create(name: 'Lily', password: 'baseball', bio:"I'm cool", fav_cuisine:'cuban', image:"http://pixel.nymag.com/imgs/daily/vulture/2016/02/09/9-johnny-depp.w529.h529.jpg", allergies:"cucumber, sesame seeds, gluten", hometown:'San Mateo', email: 'lily@lily.com')

user_2 = User.create(name: 'Rob', password: 'soccer', bio:"make something up", fav_cuisine:'japanese', image:'http://www.northerntool.com/images/product/2000x2000/547/547545_2000x2000.jpg', allergies:"chicken breast, peanuts", hometown:'Seattle', email: 'rob@bob.com')

user_3 = User.create(name: 'Yichen', password: 'ball', bio:"i started liking food when i was 11", fav_cuisine:'lebanese', image:'https://media.licdn.com/media/AAEAAQAAAAAAAAlKAAAAJGYzZjk3ZTljLTNmOTUtNGEwMS05ZTdlLWI0ZTFiOGI2Mjc4Mg.jpg', allergies:"lemon, lime, potato", hometown:'paris', email: 'matsumoto@ruby.com')

user_4 =User.create(name: 'Avi', password: 'pingpong', bio:"orange is my fave color", fav_cuisine:'french', image:'http://paypizzapal.com/wp-content/uploads/2014/01/pizza-hut2.jpg', allergies:"cucumber, sesame seeds, gluten", hometown:'barcelona', email: 'avi@avi.com')

user_1.reader = Reader.create(user_id: user_1.id)
user_1.author = Author.create(user_id: user_1.id)
user_2.reader = Reader.create(user_id: user_2.id)
user_2.author = Author.create(user_id: user_2.id)
user_3.reader = Reader.create(user_id: user_3.id)
user_3.author = Author.create(user_id: user_3.id)
user_4.reader = Reader.create(user_id: user_4.id)
user_4.author = Author.create(user_id: user_4.id)

recipe_1 = Recipe.create(author_id: user_1.author.id, image: 'https://scontent-lga3-1.cdninstagram.com/t51.2885-15/e35/13736961_131083353991134_1314770854_n.jpg', title: 'Japanese Poke!',
	content:'Slice the tuna: Using a sharp knife, cut the tuna into 1-inch cubes. Place in a large bowl. Combine all ingredients: Add the onions, garlic, sesame seeds, macadamia nuts, soy sauce, sesame oil, salt, and red pepper flakes. Gently mix until thoroughly combined.')
ing_1 = Ingredient.create(name: 'tuna')
ing_2 = Ingredient.create(name: 'seaweed')
ing_3 = Ingredient.create(name: 'sesame seeds')
ing_4 = Ingredient.create(name: 'lime')

recipe_1.ingredients<< ing_1
recipe_1.ingredients<< ing_2
recipe_1.ingredients<< ing_3
recipe_1.ingredients<< ing_4


recipe_2 = Recipe.create(author_id: user_3.author.id, image: 'https://scontent-lga3-1.cdninstagram.com/t51.2885-15/e35/13734419_1253516674668157_1459468106_n.jpg', title: 'Cuban Burgers',
	content:'DIRECTIONS
Lightly oil grill& heat BBQ to medium.
Whisk egg in a bowl& add next 6 ingredients.
Add any of the “stir-ins” that appeal to you.
Crumble in beef& using your hands or a fork, gently mix together.
Handle the meat as little as possible – the more you work it, the tougher it gets.
Gently shape (don’t firmly press) mixture into burgers about ¾ inch thick.
Using your thumb, make a shallow depression in the centre of each burger to prevent puffing up during cooking.
Place burgers on the grill, close lid& BBQ until NO LONGER PINK INSIDE, turning once, about 6 – 8 minutes per side.
An instant read thermometer should read 160F.
Dont abuse your burgers by pressing with a spatula, pricking with a fork or turning frequently as precious juices will be lost!
Tuck into a warm crusty bun& add your favourite toppings.')

ing_5 = Ingredient.create(name: 'egg')
ing_6 = Ingredient.create(name: 'beef')
ing_7 = Ingredient.create(name: 'bread')
ing_8 = Ingredient.create(name: 'garlic')

recipe_2.ingredients<< ing_5
recipe_2.ingredients<< ing_6
recipe_2.ingredients<< ing_7
recipe_2.ingredients<< ing_8

recipe_3 = Recipe.create(author_id: user_2.author.id, image: 'https://scontent-lga3-1.cdninstagram.com/t51.2885-15/e35/13562077_1049077925129404_1042970027_n.jpg', title: 'Smoked Salmon',
	content:'Get fresh ingredients and just stir everything with ponzu sauce :D')

ing_9 = Ingredient.create(name: 'radish')
ing_10 = Ingredient.create(name: 'salmon')
ing_11 = Ingredient.create(name: 'vinegar')
ing_12 = Ingredient.create(name: 'romaine')

recipe_3.ingredients<< ing_9
recipe_3.ingredients<< ing_10
recipe_3.ingredients<< ing_11
recipe_3.ingredients<< ing_12

recipe_4 = Recipe.create(author_id: user_4.author.id, image: 'https://scontent-lga3-1.cdninstagram.com/t51.2885-15/e35/13398702_157682511317799_1823286872_n.jpg', title: 'Chicken Waffle',
	content:'Use a waffle cooker and get wings from popeye')

ing_13 = Ingredient.create(name: 'chicken wings')
ing_14 = Ingredient.create(name: 'waffle')
ing_15 = Ingredient.create(name: 'maple syrup')
ing_16 = Ingredient.create(name: 'scallion')

recipe_4.ingredients<< ing_13
recipe_4.ingredients<< ing_14
recipe_4.ingredients<< ing_15
recipe_4.ingredients<< ing_16

ShoppingList.create(user_id:user_1.id)
ShoppingList.create(user_id:user_2.id)
ShoppingList.create(user_id:user_3.id)
ShoppingList.create(user_id:user_4.id)

recipe_1.categories << Category.create(name: "Appetizers")
recipe_1.categories << Category.create(name: "Gluten-Free")
recipe_1.categories << Category.create(name: "Main Dishes")
recipe_2.categories << Category.create(name: "Beef")
recipe_2.categories << Category.create(name: "Grilling")
recipe_2.categories << Category.create(name: "Beef")
recipe_2.categories << Category.create(name: "Snacks")
recipe_3.categories << Category.create(name: "Cakes & Cheesecakes")
recipe_3.categories << Category.create(name: "Dairy-Free")
recipe_3.categories << Category.create(name: "Beverages")
recipe_3.categories << Category.create(name: "Holiday")
recipe_4.categories << Category.create(name: "Breads & Rolls")
recipe_4.categories << Category.create(name: "Poultry/Chicken")
recipe_4.categories << Category.create(name: "Breads & Rolls")
recipe_4.categories << Category.create(name: "Paleo")

Category.create(name: "Breakfast & Brunch")
Category.create(name: "Brownies")
Category.create(name: "Bars & Candy")
Category.create(name: "Burgers")
Category.create(name: "Brats & Hot Dogs")
Category.create(name: "Cakes & Cheesecakes")
Category.create(name: "Cookies")
Category.create(name: "Dairy-Free")
Category.create(name: "Desserts")
Category.create(name: "Dips, Spreads & Sauces")
Category.create(name: "Ethnic")
Category.create(name: "Fish & Seafood")
Category.create(name: "Gluten-Free")
Category.create(name: "Grilling")
Category.create(name: "Healthy Eating")
Category.create(name: "Holiday")
Category.create(name: "Treats")
Category.create(name: "Kids Cuisines")
Category.create(name: "Main Dishes")
Category.create(name: "One Dish Meal")
Category.create(name: "Paleo")
Category.create(name: "Pasta & Pizzas")
Category.create(name: "Pies")
Category.create(name: "Poultry/Chicken")
Category.create(name: "Salad")
Category.create(name: "Sandwiches & Wraps")
Category.create(name: "Sides")
Category.create(name: "Snacks")
Category.create(name: "Soups & Stew")
Category.create(name: "Vegan")
Category.create(name: "Vegetarian")
