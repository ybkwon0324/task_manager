json.array!(@works) do |work|
  json.extract! work, :id, :user_id, :title, :content, :begin_time, :end_time, :entire_percent
  json.url work_url(work, format: :json)
end
