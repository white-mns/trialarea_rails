class CreateAllUseSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :all_use_skills do |t|
      t.integer :result_no
      t.integer :round_no
      t.integer :battle_no
      t.string :skill_concatenate

      t.timestamps
    end
  end
end
