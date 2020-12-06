class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      # t.references    :user, null: false, foreign_key: true
      t.string        :name, null: false
      t.integer       :portion, null: false
      t.integer       :time_count_id, null: false
      t.text          :how_to, null: false
      t.text          :tips
      t.integer       :calories
      t.boolean       :is_public
      t.timestamps
    end
  end
end
