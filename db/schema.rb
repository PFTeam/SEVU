# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141012001217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actividades", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "duracion"
    t.integer  "duracionReal"
    t.date     "fechaEstimadaInicio"
    t.date     "fechaRealInicio"
    t.string   "estrategiasIntervencion"
    t.text     "metodologiasIntervencion"
    t.text     "mecanismoEvaluacion"
    t.text     "resultadosEsperados"
    t.integer  "objetivo_especifico_id"
    t.integer  "proyecto_id"
    t.integer  "tipo_actividad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "actividades", ["objetivo_especifico_id"], name: "index_actividades_on_objetivo_especifico_id", using: :btree
  add_index "actividades", ["proyecto_id"], name: "index_actividades_on_proyecto_id", using: :btree
  add_index "actividades", ["tipo_actividad_id"], name: "index_actividades_on_tipo_actividad_id", using: :btree

  create_table "asignacion_actividades", force: true do |t|
    t.boolean  "vigente"
    t.integer  "actividad_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asignacion_actividades", ["actividad_id"], name: "index_asignacion_actividades_on_actividad_id", using: :btree
  add_index "asignacion_actividades", ["usuario_id"], name: "index_asignacion_actividades_on_usuario_id", using: :btree

  create_table "asignacion_funciones", force: true do |t|
    t.boolean  "esActual"
    t.text     "descripcion"
    t.integer  "usuario_id"
    t.integer  "rol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asignacion_funciones", ["rol_id"], name: "index_asignacion_funciones_on_rol_id", using: :btree
  add_index "asignacion_funciones", ["usuario_id"], name: "index_asignacion_funciones_on_usuario_id", using: :btree

  create_table "asignacion_rol_predefinidos", force: true do |t|
    t.boolean  "esActual"
    t.integer  "privilegio_id"
    t.integer  "rol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asignacion_rol_predefinidos", ["privilegio_id"], name: "index_asignacion_rol_predefinidos_on_privilegio_id", using: :btree
  add_index "asignacion_rol_predefinidos", ["rol_id"], name: "index_asignacion_rol_predefinidos_on_rol_id", using: :btree

  create_table "asignacion_roles", force: true do |t|
    t.boolean  "esActual"
    t.integer  "rol_id"
    t.integer  "proyecto_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asignacion_roles", ["proyecto_id"], name: "index_asignacion_roles_on_proyecto_id", using: :btree
  add_index "asignacion_roles", ["rol_id"], name: "index_asignacion_roles_on_rol_id", using: :btree
  add_index "asignacion_roles", ["usuario_id"], name: "index_asignacion_roles_on_usuario_id", using: :btree

  create_table "asistencia_eventos", force: true do |t|
    t.integer  "evento_publico_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asistencia_eventos", ["evento_publico_id"], name: "index_asistencia_eventos_on_evento_publico_id", using: :btree
  add_index "asistencia_eventos", ["usuario_id"], name: "index_asistencia_eventos_on_usuario_id", using: :btree

  create_table "colaboradores", force: true do |t|
    t.integer  "organizacion_externa_id"
    t.integer  "proyecto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colaboradores", ["organizacion_externa_id"], name: "index_colaboradores_on_organizacion_externa_id", using: :btree
  add_index "colaboradores", ["proyecto_id"], name: "index_colaboradores_on_proyecto_id", using: :btree

  create_table "comprobantes", force: true do |t|
    t.integer  "numero"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
    t.integer  "detalle_gasto_id"
  end

  add_index "comprobantes", ["detalle_gasto_id"], name: "index_comprobantes_on_detalle_gasto_id", using: :btree

  create_table "concepto_gastos", force: true do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detalle_gastos", force: true do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.float    "monto"
    t.integer  "concepto_gasto_id"
    t.integer  "informe_gasto_id"
    t.integer  "voluntario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "detalle_gastos", ["concepto_gasto_id"], name: "index_detalle_gastos_on_concepto_gasto_id", using: :btree
  add_index "detalle_gastos", ["informe_gasto_id"], name: "index_detalle_gastos_on_informe_gasto_id", using: :btree
  add_index "detalle_gastos", ["voluntario_id"], name: "index_detalle_gastos_on_voluntario_id", using: :btree

  create_table "detalle_presupuestos", force: true do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.float    "monto"
    t.integer  "presupuesto_id"
    t.integer  "concepto_gasto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "detalle_presupuestos", ["concepto_gasto_id"], name: "index_detalle_presupuestos_on_concepto_gasto_id", using: :btree
  add_index "detalle_presupuestos", ["presupuesto_id"], name: "index_detalle_presupuestos_on_presupuesto_id", using: :btree

  create_table "detalle_restricciones", force: true do |t|
    t.boolean  "esActiva"
    t.datetime "fechaDesde"
    t.datetime "fechaHasta"
    t.float    "montoMax"
    t.integer  "restriccion_id"
    t.integer  "concepto_gasto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "detalle_restricciones", ["concepto_gasto_id"], name: "index_detalle_restricciones_on_concepto_gasto_id", using: :btree
  add_index "detalle_restricciones", ["restriccion_id"], name: "index_detalle_restricciones_on_restriccion_id", using: :btree

  create_table "estado_actividades", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descripcion"
  end

  create_table "estado_presupuestos", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descripcion"
  end

  create_table "estado_proyectos", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descripcion"
  end

  create_table "estado_usuarios", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descripcion"
  end

  create_table "evento_publicos", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "fechaRealizacion"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "evento_publicos", ["usuario_id"], name: "index_evento_publicos_on_usuario_id", using: :btree

  create_table "experiencias", force: true do |t|
    t.boolean  "tieneExperiencia"
    t.integer  "cantidadExperiencia"
    t.integer  "habilidad_id"
    t.integer  "voluntario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiencias", ["habilidad_id"], name: "index_experiencias_on_habilidad_id", using: :btree
  add_index "experiencias", ["voluntario_id"], name: "index_experiencias_on_voluntario_id", using: :btree

  create_table "habilidades", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "tipo_habilidad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "habilidades", ["tipo_habilidad_id"], name: "index_habilidades_on_tipo_habilidad_id", using: :btree

  create_table "historial_estado_actividades", force: true do |t|
    t.integer  "actividad_id"
    t.integer  "estado_actividad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "historial_estado_actividades", ["actividad_id"], name: "index_historial_estado_actividades_on_actividad_id", using: :btree
  add_index "historial_estado_actividades", ["estado_actividad_id"], name: "index_historial_estado_actividades_on_estado_actividad_id", using: :btree

  create_table "historial_estado_presupuestos", force: true do |t|
    t.integer  "presupuesto_id"
    t.integer  "estado_presupuesto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "historial_estado_presupuestos", ["estado_presupuesto_id"], name: "index_historial_estado_presupuestos_on_estado_presupuesto_id", using: :btree
  add_index "historial_estado_presupuestos", ["presupuesto_id"], name: "index_historial_estado_presupuestos_on_presupuesto_id", using: :btree

  create_table "historial_estado_proyectos", force: true do |t|
    t.integer  "estado_proyecto_id"
    t.integer  "proyecto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "historial_estado_proyectos", ["estado_proyecto_id"], name: "index_historial_estado_proyectos_on_estado_proyecto_id", using: :btree
  add_index "historial_estado_proyectos", ["proyecto_id"], name: "index_historial_estado_proyectos_on_proyecto_id", using: :btree

  create_table "historial_estado_usuarios", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "estado_usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "historial_estado_usuarios", ["estado_usuario_id"], name: "index_historial_estado_usuarios_on_estado_usuario_id", using: :btree
  add_index "historial_estado_usuarios", ["usuario_id"], name: "index_historial_estado_usuarios_on_usuario_id", using: :btree

  create_table "horario_disponibles", force: true do |t|
    t.string   "diaSemana"
    t.time     "horaDesde"
    t.time     "horaHasta"
    t.integer  "voluntario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "horario_disponibles", ["voluntario_id"], name: "index_horario_disponibles_on_voluntario_id", using: :btree

  create_table "informe_gastos", force: true do |t|
    t.float    "montoTotal"
    t.integer  "proyecto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "informe_gastos", ["proyecto_id"], name: "index_informe_gastos_on_proyecto_id", using: :btree

  create_table "necesidades", force: true do |t|
    t.text     "descripcion"
    t.text     "ambitoAplicacion"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "titulo"
  end

  add_index "necesidades", ["usuario_id"], name: "index_necesidades_on_usuario_id", using: :btree

  create_table "notas", force: true do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.integer  "voluntario_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notas", ["usuario_id"], name: "index_notas_on_usuario_id", using: :btree
  add_index "notas", ["voluntario_id"], name: "index_notas_on_voluntario_id", using: :btree

  create_table "notificacion_predeterminadas", force: true do |t|
    t.integer  "proyecto_id"
    t.integer  "tipo_notificacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notificacion_predeterminadas", ["proyecto_id"], name: "index_notificacion_predeterminadas_on_proyecto_id", using: :btree
  add_index "notificacion_predeterminadas", ["tipo_notificacion_id"], name: "index_notificacion_predeterminadas_on_tipo_notificacion_id", using: :btree

  create_table "notificaciones", force: true do |t|
    t.date     "fechaNotificacion"
    t.time     "horaNotificacion"
    t.boolean  "esActiva"
    t.text     "mensaje"
    t.boolean  "notificado"
    t.integer  "usuarioCreador_id"
    t.integer  "usuarioDestino_id"
    t.integer  "evento_publico_id"
    t.integer  "proyecto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "destinatario"
    t.string   "asunto"
    t.string   "remitente"
  end

  add_index "notificaciones", ["evento_publico_id"], name: "index_notificaciones_on_evento_publico_id", using: :btree
  add_index "notificaciones", ["proyecto_id"], name: "index_notificaciones_on_proyecto_id", using: :btree
  add_index "notificaciones", ["usuarioCreador_id"], name: "index_notificaciones_on_usuarioCreador_id", using: :btree
  add_index "notificaciones", ["usuarioDestino_id"], name: "index_notificaciones_on_usuarioDestino_id", using: :btree

  create_table "objetivo_especificos", force: true do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.integer  "objetivo_general_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "objetivo_especificos", ["objetivo_general_id"], name: "index_objetivo_especificos_on_objetivo_general_id", using: :btree

  create_table "objetivo_generales", force: true do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.integer  "proyecto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "objetivo_generales", ["proyecto_id"], name: "index_objetivo_generales_on_proyecto_id", using: :btree

  create_table "organizacion_externas", force: true do |t|
    t.string   "sigla"
    t.string   "denominacion"
    t.string   "cuit"
    t.string   "direccion"
    t.string   "fax"
    t.string   "telefono"
    t.string   "nombreResponsable"
    t.string   "cargoResponsable"
    t.string   "numeroContactoResponsable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "postulaciones", force: true do |t|
    t.boolean  "aceptado"
    t.integer  "proyecto_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postulaciones", ["proyecto_id"], name: "index_postulaciones_on_proyecto_id", using: :btree
  add_index "postulaciones", ["usuario_id"], name: "index_postulaciones_on_usuario_id", using: :btree

  create_table "presupuestos", force: true do |t|
    t.datetime "fechaPresentacion"
    t.integer  "montoTotal"
    t.boolean  "aprobado"
    t.integer  "proyecto_id"
    t.integer  "restriccion_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presupuestos", ["proyecto_id"], name: "index_presupuestos_on_proyecto_id", using: :btree
  add_index "presupuestos", ["restriccion_id"], name: "index_presupuestos_on_restriccion_id", using: :btree
  add_index "presupuestos", ["usuario_id"], name: "index_presupuestos_on_usuario_id", using: :btree

  create_table "privilegios", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "tipo_privilegio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "privilegios", ["tipo_privilegio_id"], name: "index_privilegios_on_tipo_privilegio_id", using: :btree

  create_table "proyectos", force: true do |t|
    t.string   "nombre"
    t.text     "breveDescripcion"
    t.date     "fechaInicio"
    t.date     "fechaFin"
    t.text     "antecedentes"
    t.text     "justificacionProyecto"
    t.integer  "cantidadBeneficiariosDirectos"
    t.integer  "cantidadBeneficiariosIndirectos"
    t.text     "justificacionImpacto"
    t.text     "localizacionGeografica"
    t.integer  "tipo_proyecto_id"
    t.integer  "necesidad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proyectos", ["necesidad_id"], name: "index_proyectos_on_necesidad_id", using: :btree
  add_index "proyectos", ["tipo_proyecto_id"], name: "index_proyectos_on_tipo_proyecto_id", using: :btree

  create_table "reportes", force: true do |t|
    t.text     "descripcion"
    t.integer  "asignacion_actividad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reportes", ["asignacion_actividad_id"], name: "index_reportes_on_asignacion_actividad_id", using: :btree

  create_table "requisitos", force: true do |t|
    t.integer  "actividad_id"
    t.integer  "habilidad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requisitos", ["actividad_id"], name: "index_requisitos_on_actividad_id", using: :btree
  add_index "requisitos", ["habilidad_id"], name: "index_requisitos_on_habilidad_id", using: :btree

  create_table "restricciones", force: true do |t|
    t.datetime "fechaDesde"
    t.datetime "fechaHasta"
    t.boolean  "esActiva"
    t.integer  "tipo_proyecto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restricciones", ["tipo_proyecto_id"], name: "index_restricciones_on_tipo_proyecto_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "tipo_rol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["tipo_rol_id"], name: "index_roles_on_tipo_rol_id", using: :btree

  create_table "sesiones", force: true do |t|
    t.datetime "fechaInicio"
    t.datetime "fechaFin"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sesiones", ["usuario_id"], name: "index_sesiones_on_usuario_id", using: :btree

  create_table "tipo_actividades", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_habilidades", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_notificaciones", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_privilegios", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_proyectos", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_roles", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_transacciones", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transacciones", force: true do |t|
    t.text     "descripcion"
    t.datetime "fechaTransaccion"
    t.integer  "proyecto_id"
    t.integer  "tipo_transaccion_id"
    t.integer  "sesion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transacciones", ["proyecto_id"], name: "index_transacciones_on_proyecto_id", using: :btree
  add_index "transacciones", ["sesion_id"], name: "index_transacciones_on_sesion_id", using: :btree
  add_index "transacciones", ["tipo_transaccion_id"], name: "index_transacciones_on_tipo_transaccion_id", using: :btree

  create_table "usuarios", force: true do |t|
    t.string   "nombreUsuario"
    t.string   "apellido_nombre"
    t.string   "direccion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "legajo"
    t.string   "type"
    t.string   "telefono"
    t.string   "fax"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
