class AddIndexToMatching < ActiveRecord::Migration[6.0]
  def change
    add_index :matchings, [:result_no, :round_no, :battle_no],     :unique => false, :name => 'resultno_battleno'
    add_index :matchings, [:result_no, :round_no, :left_link_no],  :unique => false, :name => 'resultno_leftlinkeno'
    add_index :matchings, [:result_no, :round_no, :right_link_no], :unique => false, :name => 'resultno_rightlinkeno'
  end
end
