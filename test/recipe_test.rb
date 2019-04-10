require './lib/ingredient'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'
require 'mocha/minitest'
require 'pry'

class RecipeTest < Minitest::Test
  def test_it_exist
    recipe = Recipe.new("chicken casserole")

    assert_instance_of Recipe, recipe
  end

  def test_it_has_attributes
    recipe = Recipe.new("chicken casserole")

    assert_equal "chicken casserole", recipe.name
    assert_equal [], recipe.ingredients
  end

  def test_can_add_ingredients
    ingredient_1 = Ingredient.new("chicken", "grams", 80)
    ingredient_2 = Ingredient.new("green beans", "can", 40)
    recipe = Recipe.new("chicken casserole")
    recipe.add_ingredient(ingredient_1, 2)
    recipe.add_ingredient(ingredient_2, 3)
    expected = [{:ingredient=>"chicken", :amount=>2, :unit=>"grams", :calories=>80}, {:ingredient=>"green beans", :amount=>3, :unit=>"can", :calories=>40}]
    assert_equal expected ,recipe.ingredients
  end

  def test_check_quantity_needed
    ingredient_1 = Ingredient.new("chicken", "grams", 80)
    ingredient_2 = Ingredient.new("green beans", "can", 40)
    recipe_1 = mock("chicken")
    recipe_1.stubs(amount: 3, ingredient: "chicken")
    recipe = Recipe.new(recipe_1)
    recipe.add_ingredient(ingredient_1, 2)
    recipe.add_ingredient(ingredient_2, 3)

    assert_equal 1, recipe.how_much_more?(ingredient_1)
  end

  def test_can_check_total_calories_in_dish
    ingredient_1 = Ingredient.new("chicken", "grams", 80)
    ingredient_2 = Ingredient.new("green beans", "can", 40)
    recipe = Recipe.new("chicken casserole")
    recipe.add_ingredient(ingredient_1, 2)
    recipe.add_ingredient(ingredient_2, 3)

    assert_equal 120, recipe.total_calories
  end

end
