class CreateRecipeIngredientRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredient_relations do |t|
      t.references    :recipe, foreign_key: true
      t.references    :ingredient, foreign_key: true
      t.string        :quantity,        null: false
      t.integer       :measurement_id,  null: false
      t.timestamps
    end
  end
end
