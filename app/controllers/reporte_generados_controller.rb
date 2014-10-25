class ReporteGeneradosController < ApplicationController

  def reporte_generado
		authorize! :reporte_generado, ReporteGenerado
  end

  def reporte_new
		authorize! :reporte_new, ReporteGenerado
  end

  def reporte_proyectos
		authorize! :reporte_proyectos, ReporteGenerado
  end

  def reporte_regionales
		authorize! :reporte_regionales, ReporteGenerado
  end

	def reporte_voluntarios
		authorize! :reporte_voluntarios, ReporteGenerado
  end

end
