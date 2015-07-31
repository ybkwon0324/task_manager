json.array!(@work_details) do |work_detail|
  json.extract! work_detail, :id, :user_id, :work_id, :content_detail, :completion
  json.url work_detail_url(work_detail, format: :json)
end
