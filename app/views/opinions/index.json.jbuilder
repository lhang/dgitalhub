json.array!(@opinions) do |opinion|
  json.extract! opinion, :id, :content, :user_id, :parent_opinion_id
  json.url opinion_url(opinion, format: :json)
end
