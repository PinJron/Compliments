class AddRelationsUserCompliments < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :created_at, :datetime
  end
end
