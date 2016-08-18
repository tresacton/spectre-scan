json.extract! project, :id, :name, :min_freq, :max_freq, :device, :bin_size, :notes, :created_at, :updated_at
json.url project_url(project, format: :json)