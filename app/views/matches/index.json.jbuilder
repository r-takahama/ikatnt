json.array!(@matches) do |match|
  json.extract! match, :id, :fes_id, :MyUserID, :MyTeamName, :MyTwitterID, :MyNNID, :EnemyUserID, :EnemyTeamName, :EnemyTwitterID, :EnemyNNID, :NumberOfWins, :NumberOfLosses
  json.url match_url(match, format: :json)
end
