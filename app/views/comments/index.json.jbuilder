json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :user_id, :parent_coment_id
  json.url comment_url(comment, format: :json)
end
