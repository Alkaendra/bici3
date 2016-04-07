json.array!(@categoria) do |categorium|
  json.extract! categorium, :id, :titulo, :slug, :descripcion, :image, :meta_descripcion, :featured
  json.url categorium_url(categorium, format: :json)
end
