class CreateShoppinglists < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppinglists do |t|
      t.references  :recipe, null:false, presence: true
      t.boolean     :is_checked
      t.timestamps
    end
  end
end
