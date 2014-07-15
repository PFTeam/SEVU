require 'test_helper'

class EstadoUsuariosControllerTest < ActionController::TestCase
  setup do
    @estado_usuario = estado_usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estado_usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estado_usuario" do
    assert_difference('EstadoUsuario.count') do
      post :create, estado_usuario: { nombre: @estado_usuario.nombre }
    end

    assert_redirected_to estado_usuario_path(assigns(:estado_usuario))
  end

  test "should show estado_usuario" do
    get :show, id: @estado_usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estado_usuario
    assert_response :success
  end

  test "should update estado_usuario" do
    patch :update, id: @estado_usuario, estado_usuario: { nombre: @estado_usuario.nombre }
    assert_redirected_to estado_usuario_path(assigns(:estado_usuario))
  end

  test "should destroy estado_usuario" do
    assert_difference('EstadoUsuario.count', -1) do
      delete :destroy, id: @estado_usuario
    end

    assert_redirected_to estado_usuarios_path
  end
end
