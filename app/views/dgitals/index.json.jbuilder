json.array!(@dgitals) do |dgital|
  json.extract! dgital, :id, :title, :intro, :link
  # json.url dgital_url(dgital, format: :json)
end
