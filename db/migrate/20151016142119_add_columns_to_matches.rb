class AddColumnsToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :round, :integer
    add_column :matches, :battleID, :integer
    add_column :matches, :leftUserID, :string
    add_column :matches, :leftTeamName, :string
    add_column :matches, :leftTwitterID, :string
    add_column :matches, :leftNNID, :string
    add_column :matches, :rightUserID, :string
    add_column :matches, :rightTeamName, :string
    add_column :matches, :rightTwitterID, :string
    add_column :matches, :rightNNID, :string
    add_column :matches, :resultLeftWins, :integer
    add_column :matches, :resultRightWins, :integer
    add_column :matches, :leftWinsReportedByLeft, :integer
    add_column :matches, :rightWinsReportedByLeft, :integer
    add_column :matches, :leftWinsReportedByRight, :integer
    add_column :matches, :rightWinsReportedByRight, :integer
    remove_column :matches, :MyUserID, :string
    remove_column :matches, :MyTeamName, :string
    remove_column :matches, :MyTwitterID, :string
    remove_column :matches, :MyNNID, :string
    remove_column :matches, :EnemyUserID, :string
    remove_column :matches, :EnemyTeamName, :string
    remove_column :matches, :EnemyTwitterID, :string
    remove_column :matches, :EnemyNNID, :string
    remove_column :matches, :NumberOfWins, :integer
    remove_column :matches, :NumberOfLosses, :integer
  end
end
