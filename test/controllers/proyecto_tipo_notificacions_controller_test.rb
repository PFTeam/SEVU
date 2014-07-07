require 'test_helper'

class ProyectoTipoNotificacionsControllerTest < ActionController::TestCase
  setup do
    @proyecto_tipo_notificacion = proyecto_tipo_notificacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proyecto_tipo_notificacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proyecto_tipo_notificacion" do
    assert_difference('ProyectoTipoNotificacion.count') do
      post :create, proyecto_tipo_notificacion: { proyecto_id: @proyecto_tipo_notificacion.proyecto_id, tipo_notificacion_id: @proyecto_tipo_notificacion.tipo_notificacion_id }
    end

    assert_redirected_to proyecto_tipo_notificacion_path(assigns(:proyecto_tipo_notificacion))
  end

  test "should show proyecto_tipo_notificacion" do
    get :show, id: @proyecto_tipo_notificacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proyecto_tipo_notificacion
    assert_response :success
  end

  test "should update proyecto_tipo_notificacion" do
    patch :update, id: @proyecto_tipo_notificacion, proyecto_tipo_notificacion: { proyecto_id: @proyecto_tipo_notificacion.proyecto_id, tipo_notificacion_id: @proyecto_tipo_notificacion.tipo_notificacion_id }
    assert_redirected_to proyecto_tipo_notificacion_path(assigns(:proyecto_tipo_notificacion))
  end

  test "should destroy proyecto_tipo_notificacion" do
    assert_difference('ProyectoTipoNotificacion.count', -1) do
      delete :destroy, id: @proyecto_tipo_notificacion
    end

    assert_redirected_to proyecto_tipo_notificacions_path
  end
end
