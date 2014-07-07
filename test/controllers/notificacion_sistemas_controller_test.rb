require 'test_helper'

class NotificacionSistemasControllerTest < ActionController::TestCase
  setup do
    @notificacion_sistema = notificacion_sistemas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notificacion_sistemas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notificacion_sistema" do
    assert_difference('NotificacionSistema.count') do
      post :create, notificacion_sistema: {  }
    end

    assert_redirected_to notificacion_sistema_path(assigns(:notificacion_sistema))
  end

  test "should show notificacion_sistema" do
    get :show, id: @notificacion_sistema
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notificacion_sistema
    assert_response :success
  end

  test "should update notificacion_sistema" do
    patch :update, id: @notificacion_sistema, notificacion_sistema: {  }
    assert_redirected_to notificacion_sistema_path(assigns(:notificacion_sistema))
  end

  test "should destroy notificacion_sistema" do
    assert_difference('NotificacionSistema.count', -1) do
      delete :destroy, id: @notificacion_sistema
    end

    assert_redirected_to notificacion_sistemas_path
  end
end
