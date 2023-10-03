class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # t.string :id, null: false
      t.string :name
      t.string :email
      t.integer :role_id
      t.integer :last_compliment_id
    end
    # add_index :users, :id, unique: true
  end
end
