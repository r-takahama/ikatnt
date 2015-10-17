json.array!(@matches) do |match|
  json.extract! match, :id, :fes_id, :round, :battleID, :leftUserID, :leftTeamName, :leftTwitterID, :leftNNID, :rightUserID, :rightTeamName, :rightTwitterID, :rightNNID, :resultLeftWins, :resultRightWins, :leftWinsReportedByLeft, :rightWinsReportedByLeft, :leftWinsReportedByRight, :rightWinsReportedByRight
  json.url match_url(match, format: :json)
end
