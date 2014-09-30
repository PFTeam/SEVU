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

  resources :postulaciones

  resources :notas

  resources :asignacion_roles

  resources :roles

  

  resources :reportes

  resources :asignacion_actividades

  resources :requisitos

  resources :habilidades

  resources :notificacion_predeterminadas

  resources :historial_estado_actividades

  resources :actividades

  resources :objetivo_especificos

  resources :objetivo_generales

  resources :historial_estado_proyectos

  resources :proyectos do
    resources :asignacion_roles
  end

  resources :necesidades

  resources :voluntarios do
    resources :experiencias 
    resources :horario_disponibles
    resources :notas
   
  end
  resources :horario_disponibles
  
  resources :experiencias
  
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

  resources :estvlado_actividades

  resources :tipo_proyectos

  resources :estado_proyectos

  get 'mis_proyectos', :as => 'proyectos/mis_proyectos', :controller => :proyectos
  get 'mis_necesidades', :as => 'necesidades/mis_necesidades', :controller => :necesidades

  get 'crear_organizacion_externa', :controller => :proyectos

  get 'gestionar_presupuesto/:id' => 'presupuestos#gestionar_presupuesto', :as => 'gestionar_presupuesto'
  get 'gestionar_experiencias/:id' => 'voluntarios#gestionar_experiencias', :as => 'gestionar_experiencias'
  get 'gestionar_restricciones' => 'restricciones#gestionar_restricciones', :as => 'gestionar_restricciones'

  get 'horarios_disponibles/:id' => 'voluntarios#gestion_horarios_disponibles', :as => 'gestion_horarios_disponibles'
  get 'gestionar_nota_P/:id'  => 'voluntarios#gestionar_nota_P',:as => 'gestionar_nota_P'
  get 'gestionar_estado_usuario'=> 'voluntarios#gestionar_estado_usuario',:as =>'gestionar_estado_usuario'
 #para el metodo get "la forma de llamado=> controlado#metodo =>,:as=>pach 
  #voluntario_controller/gestion_horario_disponibles/gestion_horario_disponible.html

  get 'gestionar_habilidades' => 'tipo_habilidades#gestionar_habilidades', :as => 'gestionar_habilidades'
	
	#root :to => "usuarios#index"

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
