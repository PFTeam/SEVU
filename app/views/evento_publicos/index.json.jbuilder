json.array!(@evento_publicos) do |evento_publico|
  json.extract! evento_publico, :id, :nombre, :descripcion, :fechaRealizacion, :usuario_id
  json.url evento_publico_url(evento_publico, format: :json)
end
