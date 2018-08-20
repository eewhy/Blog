class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :city
      t.string :state
      t.text :bio
      #track of timestamps for user
      t.timestamps
    end
  end
end
