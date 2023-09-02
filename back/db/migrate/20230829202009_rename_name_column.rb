class RenameNameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :compliments, :name, :compliment_text
  end
end
