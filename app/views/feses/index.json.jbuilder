json.array!(@feses) do |fes|
  json.extract! fes, :id, :fesName, :adminName, :adminTwitterID, :description, :rule, :limitNumberOfTeam, :startDate, :registrationDeadline, :adminCommunityName, :adminCommunityURL
  json.url fes_url(fes, format: :json)
end
