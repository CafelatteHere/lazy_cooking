class RecipesIngredient

  include ActiveModel::Model

  concerning :RecipeBuilder do
    def recipe
      @recipe ||= Recipe.new
    end
  end

  concerning :IngredientsBuilder do
    attr_reader :ingredients_attributes

    def ingredients
      @ingredients_attributes ||= Ingredient.new
    end

    def ingredients_attributes=(attributes)
      @ingredients_attributes = Ingredient.new(attributes)
    end
  end

  concerning :RecipeIngredientRelationsBuilder do
    attr_reader :recipe_ingredient_relations_attributes

    def recipe_ingredient_relations
      @recipe_ingredient_relations_attributes ||= RecipeIngredientRelation.new
    end

    def recipe_ingredient_relations_attributes=(attributes)
      @recipe_ingredient_relations_attributes = RecipeIngredientRelation.new(attributes)
    end
  end

  attr_accessor  :name, :image, :portions, :time_count_id, :content, :tips, :calories, :is_public, :user_id, :i_name, :quantity, :measurement_id

    with_options presence: true do
      validates :i_name  #, uniqueness: true
      validates :quantity, length:{maximum: 10}
      validates :measurement_id
      validates :name
      validates :portions
      validates :time_count_id, numericality: {other_than: 1}
      validates :content
      validates :tips, allow_blank: true
      validates :calories, allow_blank: true
      validates :is_public
    end



    def save
      binding.pry
      return false if invalid?
      recipe.assign_attributes(recipe_params)
      recipe.ingredients.build(ingredients_params)
      recipe.recipe_ingredient_relations.build(recipe_ingredient_relations_params)



      if recipe.save
        true
      else
        binding.pry
        false
      end
    end

  private

  def recipe_params
    {
      user_id: user_id,
      name: name,
      image: image,
      portions: portions,
      time_count_id: time_count_id,
      content: content,
      tips: tips,
      calories: calories,
      is_public: is_public
    }
  end

  def ingredients_params
    {
      i_name: i_name
    }
  end

  def recipe_ingredient_relations_params
    {
      quantity: quantity,
      measurement_id: measurement_id
    }
  end

end