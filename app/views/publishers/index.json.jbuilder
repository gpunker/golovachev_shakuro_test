# frozen_string_literal: true

json.array! @publishers do |publisher|
  json.id publisher.id
  json.name publisher.name
  json.url publishers_show_path(publisher.slug)
end
