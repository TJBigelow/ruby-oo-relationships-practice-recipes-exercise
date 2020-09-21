require_relative '../config/environment.rb'

tom = User.new('Tom')
tyler = User.new('Tyler')

crust = Ingredient.new('Crust')
sauce = Ingredient.new('Sauce')
cheese = Ingredient.new('Cheese')
bread = Ingredient.new('Bread')

pizza = Recipe.new('Pizza', [crust, sauce, cheese])
grilled_cheese = Recipe.new('Grilled Cheese', [bread, cheese])
tomato_soup = Recipe.new('Tomato Soup', [sauce])
quesadilla = Recipe.new('Quesadilla', [crust, cheese])

tom.add_recipe_card(pizza, '2020-9-20', 10)
tom.add_recipe_card(tomato_soup, '2021-10-04', 1)
tom.add_recipe_card(quesadilla, '2020-9-18', 8)
# tyler.add_recipe_card(pizza, '2020-9-20', 7)
tom.add_recipe_card(grilled_cheese, '2020-5-14', 2)
tyler.add_recipe_card(grilled_cheese, '2020-2-16', 9)


tyler.declare_allergy(bread)
tom.declare_allergy(crust)
tom.declare_allergy(sauce)

binding.pry
