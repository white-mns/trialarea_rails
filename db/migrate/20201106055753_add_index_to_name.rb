class AddIndexToName < ActiveRecord::Migration[6.0]
  def change
    add_index :names, [:result_no, :round_no, :link_no], :unique => false, :name => 'resultno_linkno'
    add_index :names, [:result_no, :round_no, :name], :unique => false, :name => 'resultno_name'
    add_index :names, [:result_no, :round_no, :player_id], :unique => false, :name => 'resultno_playerid'
    add_index :names, [:result_no, :round_no, :player], :unique => false, :name => 'resultno_player'
  end
end
