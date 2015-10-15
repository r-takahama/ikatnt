class CreateParticipations < ActiveRecord::Migration
  def change
 #   drop_table :participations
    create_table :participations do |t|
      t.references :fes, index: true, foreign_key: true
      t.string :teamName, null: false
      t.string :TwitterID, null: false
      t.string :NNID, null: false
      t.string :UserID, null: false

      t.timestamps null: false
    end
  end
end
