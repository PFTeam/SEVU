class ReporteGeneradosController < ApplicationController

  def reporte_generado
		authorize! :reporte_generado, ReporteGenerado
  end

  def reporte_new
		authorize! :reporte_new, ReporteGenerado
  end
	
	def reporte_voluntarios
		authorize! :reporte_voluntarios, ReporteGenerado
		if params[:usuario_ids].blank? || params[:item_ids].blank?  
    		@error = '1';
		else
				 redirect_to reporte_generado_path( :tipo_rep => 1, :anio => params[:anio_rep], :u_ids => params[:usuario_ids], :i_ids => params[:item_ids] )
 		end 
  end	

  def reporte_proyectos
		authorize! :reporte_proyectos, ReporteGenerado
		if params[:proyecto_ids].blank? || params[:item_ids].blank?  
    		@error = '1';
		else
				 redirect_to reporte_generado_path( :tipo_rep => 2, :anio => params[:anio_rep], :p_ids => params[:proyecto_ids], :i_ids => params[:item_ids] )
 		end 
  end

  def reporte_regionales
		authorize! :reporte_regionales, ReporteGenerado
		if params[:regional_ids].blank? || params[:item_ids].blank?  
    		@error = '1';
		else
				 redirect_to reporte_generado_path( :tipo_rep => 3, :anio => params[:anio_rep], :r_ids => params[:regional_ids], :i_ids => params[:item_ids] )
 		end 
  end

end
