class CreateCompliments < ActiveRecord::Migration[7.0]
  def change
    create_table :compliments do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.boolean :is_used
    end
  end
end
