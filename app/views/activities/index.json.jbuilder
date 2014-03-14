json.array!(@activities) do |activity|
  json.extract! activity, :id, :user_id, :name, :is_count
  json.url activity_url(activity, format: :json)
end
