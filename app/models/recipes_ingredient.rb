class RecipesIngredient
  include ActiveModel::Model

  attr_accessor :name, :image, :portions, :time_count_id, :content, :tips, :calories, :is_public, :user_id, :i_name, :quantity, :measurement_id

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
      recipe = Recipe.new(name:name, image:image, portions:portions, time_count_id:time_count_id, content:content, tips:tips, calories:calories, is_public:is_public, user_id:user_id)
      ingredient = Ingredient.new(i_name: i_name)
      recipe.save
      ingredient.save

      recipe_ingredient_relations = RecipeIngredientRelation.create(quantity: quantity, measurement_id: measurement_id, recipe_id: recipe.id, ingredient_id:ingredient.id)
      return false if invalid?
      if recipe.save && ingredient.save && recipe_ingredient_relations.save
        true
         else
        false
         end
    end


    # def persisted?
    #   @recipe.persisted? && @ingredient.persisted? && @recipe_ingredient_relations.persisted?
    # end

    # def id
    #   @recipe.id
    # end
end