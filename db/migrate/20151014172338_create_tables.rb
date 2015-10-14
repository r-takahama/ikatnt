class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.references :fes, index: true, foreign_key: true
      t.string :teamName
      t.string :UserID
      t.integer :teamNumber
      t.integer :seedNumber

      t.timestamps null: false
    end
  end
end
