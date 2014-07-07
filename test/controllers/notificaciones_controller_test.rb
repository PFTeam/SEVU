require 'test_helper'

class NotificacionesControllerTest < ActionController::TestCase
  setup do
    @notificacion = notificaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notificaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notificacion" do
    assert_difference('Notificacion.count') do
      post :create, notificacion: { esActiva: @notificacion.esActiva, evento_publico_id: @notificacion.evento_publico_id, fechaNotificacion: @notificacion.fechaNotificacion, horaNotificacion: @notificacion.horaNotificacion, mensaje: @notificacion.mensaje, notificado: @notificacion.notificado, proyecto_id: @notificacion.proyecto_id, usuarioCreador_id: @notificacion.usuarioCreador_id, usuarioDestino_id: @notificacion.usuarioDestino_id }
    end

    assert_redirected_to notificacion_path(assigns(:notificacion))
  end

  test "should show notificacion" do
    get :show, id: @notificacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notificacion
    assert_response :success
  end

  test "should update notificacion" do
    patch :update, id: @notificacion, notificacion: { esActiva: @notificacion.esActiva, evento_publico_id: @notificacion.evento_publico_id, fechaNotificacion: @notificacion.fechaNotificacion, horaNotificacion: @notificacion.horaNotificacion, mensaje: @notificacion.mensaje, notificado: @notificacion.notificado, proyecto_id: @notificacion.proyecto_id, usuarioCreador_id: @notificacion.usuarioCreador_id, usuarioDestino_id: @notificacion.usuarioDestino_id }
    assert_redirected_to notificacion_path(assigns(:notificacion))
  end

  test "should destroy notificacion" do
    assert_difference('Notificacion.count', -1) do
      delete :destroy, id: @notificacion
    end

    assert_redirected_to notificaciones_path
  end
end
