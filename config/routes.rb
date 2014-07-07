Rails.application.routes.draw do
  resources :detalle_presupuestos

  resources :historial_estado_presupuestos

  resources :presupuestos

  resources :detalle_gastos

  resources :transaccions

  resources :sesions

  resources :historial_estado_usuarios

  resources :asignacion_rol_sistemas

  resources :asistencia_evento_publicos

  resources :asignacion_rol_predefinidos

  resources :privilegios

  resources :notificacion_sistemas

  resources :notificacion_emails

  resources :notificacions

  resources :evento_publicos

  resources :informe_gastos

  resources :detalle_restriccions

  resources :restriccions

  resources :postulacion_voluntariados

  resources :nota_personals

  resources :asignacion_rol_proyectos

  resources :rols

  resources :horario_disponibles

  resources :reportes

  resources :asignacion_actividads

  resources :experiencia

  resources :actividad_habilidads

  resources :habilidads

  resources :proyecto_tipo_notificacions

  resources :historial_estado_actividads

  resources :actividads

  resources :objetivo_especificos

  resources :objetivo_generals

  resources :historialestado_proyectos

  resources :proyectos

  resources :necesidads

  resources :voluntarios

  resources :usuarios

  resources :tipo_privilegios

  resources :concepto_gastos

  resources :estado_usuarios

  resources :estado_presupuestos

  resources :tipo_transaccions

  resources :comprobantes

  resources :organizacion_externas

  resources :tipo_rols

  resources :tipo_habilidads

  resources :tipo_actividads

  resources :tipo_notificacions

  resources :estado_actividads

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
