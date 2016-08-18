json.extract! scan_item, :id, :spec_scan_id, :baseline_id, :upper, :lower, :time, :power, :created_at, :updated_at
json.url scan_item_url(scan_item, format: :json)