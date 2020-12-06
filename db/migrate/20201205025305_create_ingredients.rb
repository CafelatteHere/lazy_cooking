class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string      :i_name,            uniqueness: true
      t.string      :quantity,        null: false
      t.integer      :measurement_id,  null: false
      t.timestamps
    end
  end
end
