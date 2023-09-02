class AddCreaterAtAndAreatedBy < ActiveRecord::Migration[7.0]
  def change
    add_column :compliments, :created_at, :datetime
    add_column :compliments, :created_by_id, :integer
  end
end
