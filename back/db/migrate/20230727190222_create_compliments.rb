class CreateCompliments < ActiveRecord::Migration[7.0]
  def change
    create_table :compliments do |t|
      t.string :name
      t.boolean :is_used
    end
  end
end
