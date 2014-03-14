json.array!(@counts) do |count|
  json.extract! count, :id, :activity_id, :date
  json.url count_url(count, format: :json)
end
