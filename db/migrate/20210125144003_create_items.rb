class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references  :calendar, null:false, presence: true
      t.boolean     :is_checked
      t.timestamps
    end
  end
end
