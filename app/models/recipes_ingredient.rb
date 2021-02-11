class RecipesIngredient
  include ActiveModel::Model

  attr_accessor :recipe, :name, :image, :portions, :time_count_id, :content, :tips, :calories, :is_public, :user_id, :i_name, :quantity, :measurement_id, :ingredients, :recipe_ingredient_relations


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
      validates :is_public, allow_blank: true
    end


  delegate :persisted?, to: :recipe

    def initialize(attributes = nil, recipe: Recipe.new)
      @recipe = recipe
      # @ingredient = recipe.ingredients.first
      if @recipe.id != nil
      attributes ||= default_attributes
      end
      super(attributes)
    end

    def to_model
      recipe
    end


  def save
    if @recipe.id != nil
      @recipe.update!(name: name, image:image, portions:portions, time_count_id:time_count_id, content:content, tips:tips, calories:calories, is_public:is_public, user_id:user_id)
      @recipe.ingredients.first.update!(i_name: i_name)
      @recipe.recipe_ingredient_relations.first.update!(quantity: quantity, measurement_id: measurement_id)
    else
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
    end

    private
      attr_reader :recipe, :ingredient, :recipe_ingredient_relations
      def default_attributes
        {
          name: recipe.name, image: recipe.image, portions: recipe.portions,
          time_count_id: recipe.time_count_id, content: @recipe.content,
          tips: recipe.tips, calories: recipe.calories, is_public: recipe.is_public,
          user_id: recipe.user_id,
          i_name: recipe.ingredients.first.i_name, quantity: recipe.recipe_ingredient_relations.first.quantity, measurement_id: recipe.recipe_ingredient_relations.first.measurement_id
        }
      end
  end


