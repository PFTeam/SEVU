require 'test_helper'

class HistorialEstadoUsuariosControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @historial_estado_usuario = historial_estado_usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historial_estado_usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historial_estado_usuario" do
    assert_difference('HistorialEstadoUsuario.count') do
      post :create, historial_estado_usuario: { esActual: @historial_estado_usuario.esActual, estado_usuario_id: @historial_estado_usuario.estado_usuario_id, fechaCambioEstado: @historial_estado_usuario.fechaCambioEstado, usuario_id: @historial_estado_usuario.usuario_id }
    end

    assert_redirected_to historial_estado_usuario_path(assigns(:historial_estado_usuario))
  end

  test "should show historial_estado_usuario" do
    get :show, id: @historial_estado_usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historial_estado_usuario
    assert_response :success
  end

  test "should update historial_estado_usuario" do
    patch :update, id: @historial_estado_usuario, historial_estado_usuario: { esActual: @historial_estado_usuario.esActual, estado_usuario_id: @historial_estado_usuario.estado_usuario_id, fechaCambioEstado: @historial_estado_usuario.fechaCambioEstado, usuario_id: @historial_estado_usuario.usuario_id }
    assert_redirected_to historial_estado_usuario_path(assigns(:historial_estado_usuario))
  end

  test "should destroy historial_estado_usuario" do
    assert_difference('HistorialEstadoUsuario.count', -1) do
      delete :destroy, id: @historial_estado_usuario
    end

    assert_redirected_to historial_estado_usuarios_path
  end
end
