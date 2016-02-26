json.array!(@statistics) do |statistic|
  json.extract! statistic, :id, :fighter_id, :win, :lost, :experience
  json.url statistic_url(statistic, format: :json)
end
