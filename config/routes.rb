Rails.application.routes.draw do

	devise_for :usuarios

  resources :colaboradores

  resources :detalle_presupuestos#, only: [:index, :show, :edit, :update, :destroy]

  resources :historial_estado_presupuestos

  resources :presupuestos do
    resources :detalle_presupuestos#, only: [:new, :create]
  end

  resources :detalle_gastos

  resources :transacciones

  resources :sesiones

  resources :historial_estado_usuarios

  resources :asignacion_funciones

  resources :asistencia_eventos

  resources :asignacion_rol_predefinidos

  resources :privilegios

  resources :notificacion_sistemas

  resources :notificacion_emailes

  resources :notificaciones

  resources :evento_publicos

  resources :informe_gastos do
    resources :detalle_gastos #, only: [:new, :create]
  end

  resources :detalle_restricciones

  resources :restricciones do
    resources :detalle_restricciones #, only: [:new, :create]
  end

  resources :postulaciones do
	  member do
	    post 'aceptar'
	  end
  end

  resources :notas

  resources :asignacion_roles

  resources :roles

  resources :horario_disponibles

  resources :reportes

  resources :asignacion_actividades

  resources :experiencias

  resources :requisitos

  resources :habilidades

  resources :notificacion_predeterminadas

  resources :historial_estado_actividades

  resources :actividades

  resources :objetivo_especificos do
    resources :actividades
  end

  resources :objetivo_generales do
    resources :objetivo_especificos
  end

  resources :historial_estado_proyectos

  resources :proyectos do
    resources :asignacion_roles
    resources :notificacion_predeterminadas

  get 'notificaciones_predeterminadas' => 'notificacion_predeterminadas#notificaciones_predeterminadas', :as => 'notificaciones_predeterminadas'

    resources :objetivo_generales
    resources :postulaciones

  end

  resources :necesidades

  resources :voluntarios

  resources :usuarios

  resources :tipo_privilegios

  resources :concepto_gastos

  resources :estado_usuarios

  resources :estado_presupuestos

  resources :tipo_transacciones

  resources :comprobantes

  resources :organizacion_externas

  resources :tipo_roles

  resources :tipo_habilidades do
    resources :habilidades
  end

  resources :tipo_actividades

  resources :tipo_notificaciones

  resources :estado_actividades

  resources :tipo_proyectos

  resources :estado_proyectos

  get 'mis_proyectos', :as => 'proyectos/mis_proyectos', :controller => :proyectos
  get 'mis_necesidades', :as => 'necesidades/mis_necesidades', :controller => :necesidades
  #get 'notificaciones_predeterminadas/:id', :as => 'proyectos/:id/notificaciones_predeterminadas', :controller => :notificacion_predeterminadas

  get 'agregar_habilidad', :controller => :actividades


  get 'crear_organizacion_externa', :controller => :proyectos
  get 'gestionar_presupuesto/:id' => 'presupuestos#gestionar_presupuesto', :as => 'gestionar_presupuesto'
  get 'gestionar_informe_gastos/:id' => 'informe_gastos#gestionar_informe_gastos', :as => 'gestionar_informe_gastos'
  get 'gestionar_restricciones' => 'restricciones#gestionar_restricciones', :as => 'gestionar_restricciones'

  get 'gestionar_habilidades' => 'tipo_habilidades#gestionar_habilidades', :as => 'gestionar_habilidades'

	get 'control_usuario' => 'transacciones#control_usuario', :as => 'control_usuario'

	get 'control_proyecto' => 'transacciones#control_proyecto', :as => 'control_proyecto'

	get 'control_fecha' => 'transacciones#control_fecha', :as => 'control_fecha'

	get 'reporte_voluntarios' => 'reportes#reporte_voluntarios', :as => 'reporte_voluntarios'
	
	get 'reporte_proyectos' => 'reportes#reporte_proyectos', :as => 'reporte_proyectos'

	get 'reporte_regionales' => 'reportes#reporte_regionales', :as => 'reporte_regionales'

	get 'reporte_generado' => 'reportes#reporte_generado', :as => 'reporte_generado'
	
	root :to => "necesidades#index"

  get 'gestionar_concepto_gastos' => 'concepto_gastos#gestionar_concepto_gastos', :as => 'gestionar_concepto_gastos'

  get 'evaluar_presupuestos_pendientes' => 'presupuestos#evaluar_presupuestos_pendientes', :as => 'evaluar_presupuestos_pendientes'

  get 'gestionar_estados_presupuestos' => 'estado_presupuestos#gestionar_estados_presupuestos', :as => 'gestionar_estados_presupuestos'

  get 'evaluar_presupuesto/:id' => 'presupuestos#evaluar_presupuesto', :as => 'evaluar_presupuesto'

  #get 'gestionarPresupuesto', :controller => :presupuestos
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
