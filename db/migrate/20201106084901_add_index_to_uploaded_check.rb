class AddIndexToUploadedCheck < ActiveRecord::Migration[6.0]
  def change
    add_index :uploaded_checks, [:result_no, :round_no], :unique => false, :name => 'resultno_roundno'
  end
end
