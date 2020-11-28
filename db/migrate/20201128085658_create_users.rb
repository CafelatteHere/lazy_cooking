class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string  :nickname,           null: false, unique: true
      t.string  :name,               null: false, default: ""
      t.string  :surname,            null: false, default: ""
      t.string  :email,              null: false, default: ""
      t.string  :encrypted_password, null: false, default: ""
      t.date    :birthday,           null: false, default: 0
      t.integer :country_id
      t.text    :about_me
      t.timestamps
    end
  end
end
