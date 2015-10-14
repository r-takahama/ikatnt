class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :fes, index: true, foreign_key: true
      t.string :MyUserID
      t.string :MyTeamName
      t.string :MyTwitterID
      t.string :MyNNID
      t.string :EnemyUserID
      t.string :EnemyTeamName
      t.string :EnemyTwitterID
      t.string :EnemyNNID
      t.integer :NumberOfWins
      t.integer :NumberOfLosses

      t.timestamps null: false
    end
  end
end
