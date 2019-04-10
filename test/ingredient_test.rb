require './lib/ingredient'
require 'minitest/autorun'
require 'minitest/pride'

class IngredientTest < Minitest::Test
  def test_it_exist
    ingredient = Ingredient.new("chicken", "grams", 40)

    assert_instance_of Ingredient, ingredient
  end

  def test_it_has_attributes
    ingredient = Ingredient.new("chicken", "grams", 40)

    assert_equal "chicken", ingredient.name
    assert_equal "grams", ingredient.unit
    assert_equal 40, ingredient.calories
    
  end

end
