json.array!(@votes) do |vote|
  json.extract! vote, :id, :title, :content
  json.url vote_url(vote, format: :json)
end
