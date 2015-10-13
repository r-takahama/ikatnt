json.array!(@fes) do |fe|
  json.extract! fe, :id, :fesName, :adminName, :adminTwitterID, :description, :rule, :limitNumberOfTeam, :startDate, :registrationDeadline, :adminCommunityName, :adminCommunityURL, :createDate
  json.url fe_url(fe, format: :json)
end
