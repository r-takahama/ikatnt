json.array!(@tables) do |table|
  json.extract! table, :id, :fes_id, :teamName, :UserID, :teamNumber, :seedNumber
  json.url table_url(table, format: :json)
end
