class AddLikesDislikesToCompliments < ActiveRecord::Migration[7.0]
  def change
    add_column :compliments, :likes, :integer
    add_column :compliments, :dislikes, :integer
  end
end
