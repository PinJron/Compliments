class AddCreaterAtAndAreatedBy < ActiveRecord::Migration[7.0]
  def change
    add_column :compliments, :created_at, :datetime
  end
end
