class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

    belongs_to :time_count
    has_one_attached :image
    belongs_to :user
    before_save :set_ingredient_string
    attr_writer :ingredients, :recipe_ingredient_relations

    def ingredients
      @ingredients ||= []
    end

    def ingredients_attributes=(attributes)
      @ingredients = attributes.map do |i, attribute|
        Ingredient.new(attribute)
      end
    end

    def build_ingredients
      self.ingredients = [Ingredient.new]*5
    end

    def set_ingredient_string
      self.ingredient_string = self.ingredients.map(&:name).join(' / ')
    end



    def recipe_ingredient_relations
      @recipe_ingredient_relations ||= []
    end

    def recipe_ingredient_relations_attributes=(attributes)
      @recipe_ingredient_relations = attributes.map do |i, attribute|
        RecipeIngredientRelation.new(attribute)
      end
    end

    def build_recipe_ingredient_relations
      self.recipe_ingredient_relations = [RecipeIngredientRelation.new]*5
    end

    def set_recipe_ingredient_relation_string
      self.recipe_ingredient_relation_string = self.recipe_ingredient_relations.map(&:name).join(' / ')
    end
  # has_many :recipe_ingredient_relations
  # has_many :ingredients, through: :recipe_ingredient_relations



  # accepts_nested_attributes_for :ingredients, :recipe_ingredient_relations, allow_destroy: true



end
