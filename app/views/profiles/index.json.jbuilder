json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :location, :profile_pic, :user_id
  json.url profile_url(profile, format: :json)
end
