require 'test_helper'

class NotificacionPredeterminadasControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @notificacion_predeterminada = notificacion_predeterminadas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notificacion_predeterminadas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notificacion_predeterminada" do
    assert_difference('NotificacionPredeterminada.count') do
      post :create, notificacion_predeterminada: { proyecto_id: @notificacion_predeterminada.proyecto_id, tipo_notificacion_id: @notificacion_predeterminada.tipo_notificacion_id }
    end

    assert_redirected_to notificacion_predeterminada_path(assigns(:notificacion_predeterminada))
  end

  test "should show notificacion_predeterminada" do
    get :show, id: @notificacion_predeterminada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notificacion_predeterminada
    assert_response :success
  end

  test "should update notificacion_predeterminada" do
    patch :update, id: @notificacion_predeterminada, notificacion_predeterminada: { proyecto_id: @notificacion_predeterminada.proyecto_id, tipo_notificacion_id: @notificacion_predeterminada.tipo_notificacion_id }
    assert_redirected_to notificacion_predeterminada_path(assigns(:notificacion_predeterminada))
  end

  test "should destroy notificacion_predeterminada" do
    assert_difference('NotificacionPredeterminada.count', -1) do
      delete :destroy, id: @notificacion_predeterminada
    end

    assert_redirected_to notificacion_predeterminadas_path
  end
end
