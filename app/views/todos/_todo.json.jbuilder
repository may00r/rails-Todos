json.extract! todo, :id, :text, :isComplited, :project_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
