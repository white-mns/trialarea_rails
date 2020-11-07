json.extract! skill_list, :id, :skill_id, :name, :result_no, :skill_type, :ap, :text, :is_physics, :is_fire, :is_aqua, :is_wind, :is_quake, :is_light, :is_dark, :is_poison, :created_at, :updated_at
json.url skill_list_url(skill_list, format: :json)
