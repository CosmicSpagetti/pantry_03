require './lib/ingredient'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'
require 'mocha/minitest'
require 'pry'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")

  end

  def test_it_exist
    assert_instance_of Pantry, @pantry
  end

  def test_it_has_attributes
    assert_equal ({}), @pantry.stock
  end

  def test_can_restock_stock_and_check_quantity
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal 0, @pantry.stock_check(@cheese)
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal 15,@pantry.stock_check(@cheese)
  end

  def test_can_check_for_enough_ingredients
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    mac_and_cheese = mock
    mac_and_cheese.stubs(cheese: 10, mac: 8)

    assert_equal false, @pantry.enough_ingredient_for?(mac_and_cheese)
  end
end
