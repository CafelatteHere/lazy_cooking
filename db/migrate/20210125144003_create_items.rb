class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string    :name, null:false
      t.string    :quantity
      # t.boolean   :checked
      t.timestamps
    end
  end
end
