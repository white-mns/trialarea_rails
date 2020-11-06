class CreateUploadedChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :uploaded_checks do |t|
      t.integer :result_no
      t.integer :round_no

      t.timestamps
    end
  end
end
