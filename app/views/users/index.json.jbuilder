json.array!(@users) do |user|
  json.extract! user, :id, :email, :name, :point
  json.url user_url(user, format: :json)
end
