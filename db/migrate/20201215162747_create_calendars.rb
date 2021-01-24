class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.integer     :day_id, null: false
      t.references  :recipe, null: false, foreign_key: true
      t.references  :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
