class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.integer :result_no
      t.integer :round_no
      t.integer :link_no
      t.integer :skill_id

      t.timestamps
    end
  end
end
