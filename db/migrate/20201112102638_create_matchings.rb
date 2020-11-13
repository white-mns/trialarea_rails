class CreateMatchings < ActiveRecord::Migration[6.0]
  def change
    create_table :matchings do |t|
      t.integer :result_no
      t.integer :round_no
      t.integer :battle_no
      t.integer :left_link_no
      t.integer :right_link_no

      t.timestamps
    end
  end
end
