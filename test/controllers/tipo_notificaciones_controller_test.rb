require 'test_helper'

class TipoNotificacionesControllerTest < ActionController::TestCase
  setup do
    @tipo_notificacion = tipo_notificaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_notificaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_notificacion" do
    assert_difference('TipoNotificacion.count') do
      post :create, tipo_notificacion: { nombre: @tipo_notificacion.nombre }
    end

    assert_redirected_to tipo_notificacion_path(assigns(:tipo_notificacion))
  end

  test "should show tipo_notificacion" do
    get :show, id: @tipo_notificacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_notificacion
    assert_response :success
  end

  test "should update tipo_notificacion" do
    patch :update, id: @tipo_notificacion, tipo_notificacion: { nombre: @tipo_notificacion.nombre }
    assert_redirected_to tipo_notificacion_path(assigns(:tipo_notificacion))
  end

  test "should destroy tipo_notificacion" do
    assert_difference('TipoNotificacion.count', -1) do
      delete :destroy, id: @tipo_notificacion
    end

    assert_redirected_to tipo_notificaciones_path
  end
end
