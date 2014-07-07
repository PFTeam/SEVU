json.array!(@proyectos) do |proyecto|
  json.extract! proyecto, :id, :nombre, :breveDescripcion, :fechaInicio, :fechaFin, :antecedentes, :justificacionProyecto, :cantidadBeneficiariosDirectos, :cantidadBeneficiariosIndirectos, :justificacionImpacto, :localizacionGeografica, :tipo_proyecto_id, :necesidad_id
  json.url proyecto_url(proyecto, format: :json)
end
