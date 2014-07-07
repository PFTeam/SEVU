Rails.application.routes.draw do
  resources :detalle_presupuestos

  resources :historial_estado_presupuestos

  resources :presupuestos

  resources :detalle_gastos

  resources :transacciones

  resources :sesiones

  resources :historial_estado_usuarios

  resources :asignacion_rol_sistemas

  resources :asistencia_evento_publicos

  resources :asignacion_rol_predefinidos

  resources :privilegios

  resources :notificacion_sistemas

  resources :notificacion_emailes

  resources :notificaciones

  resources :evento_publicos

  resources :informe_gastos

  resources :detalle_restricciones

  resources :restricciones

  resources :postulacion_voluntariados

  resources :nota_personales

  resources :asignacion_rol_proyectos

  resources :roles

  resources :horario_disponibles

  resources :reportes

  resources :asignacion_actividades

  resources :experiencias

  resources :actividad_habilidades

  resources :habilidades

  resources :proyecto_tipo_notificaciones

  resources :historial_estado_actividades

  resources :actividades

  resources :objetivo_especificos

  resources :objetivo_generales

  resources :historialestado_proyectos

  resources :proyectos

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

  resources :tipo_habilidades

  resources :tipo_actividades

  resources :tipo_notificaciones

  resources :estado_actividades

  resources :tipo_proyectos

  resources :estado_proyectos

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
