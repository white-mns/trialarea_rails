class CreateNameDummies < ActiveRecord::Migration[6.0]
  def change
    create_table :name_dummies do |t|
      t.integer :result_no
      t.integer :round_no
      t.integer :player_id
      t.integer :link_no
      t.string :name
      t.string :player

      t.timestamps
    end
  end
end
