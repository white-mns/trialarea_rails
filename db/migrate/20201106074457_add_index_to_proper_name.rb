class AddIndexToProperName < ActiveRecord::Migration[6.0]
  def change
    add_index :proper_names, :proper_id
    add_index :proper_names, :name
  end
end
