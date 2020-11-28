class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references    :user, null: false, foreign_key: true
      t.string        :name, null: false
      t.integer       :persons, null: false
      t.date          :time
      t.text_field    :recipe, null: false
      t.text_field    :tips
      t.integer       :calories
      t.boolean       :is_public
      t.timestamps
    end
  end
end
