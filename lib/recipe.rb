class Recipe
  attr_reader :name,
              :ingredients
  def initialize(name)
    @name = name
    @ingredients = []
  end

  def add_ingredient(ingredient, quantity)
    hash_of_ingredients = Hash.new(0)
    hash_of_ingredients[:ingredient] = ingredient.name
    hash_of_ingredients[:amount] = quantity
    hash_of_ingredients[:unit] = ingredient.unit
    hash_of_ingredients[:calories] = ingredient.calories
    @ingredients << hash_of_ingredients
  end

  def how_much_more?(ingredient)
    return_this = nil
    @ingredients.each do |ingredient|
      if ingredient[:ingredient] == @name.ingredient
        return_this = @name.amount - ingredient[:amount]
      end
    end
    return_this
  end

  def total_calories
    total = 0
    @ingredients.each do |ingredient|
      total += ingredient[:calories]
    end
    total
  end



end
