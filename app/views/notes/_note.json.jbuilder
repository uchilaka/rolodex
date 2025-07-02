json.extract! note, :id, :notable_id, :notable_type, :content, :created_at, :updated_at
json.url note_url(note, format: :json)
json.content note.content.to_s
