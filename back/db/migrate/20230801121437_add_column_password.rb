class AddColumnPassword < ActiveRecord::Migration[7.0]
  def change
    add_column :users do |u|
      u.string :username
      u.string :password_digest
    end
  end
end
