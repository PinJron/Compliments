class AddDefaultValuesToLikesAndDislikes < ActiveRecord::Migration[7.0]
  def change
    change_column :compliments, :likes, :integer
    change_column :compliments, :dislikes, :integer
    Compliment.where(likes: nil).update_all(likes: 0)
    Compliment.where(dislikes: nil).update_all(dislikes: 0)
  end
end
