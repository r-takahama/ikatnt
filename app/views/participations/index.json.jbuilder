json.array!(@participations) do |participation|
  json.extract! participation, :id, :fes_id, :teamName, :TwitterID, :NNID, :UserID
  json.url participation_url(participation, format: :json)
end
