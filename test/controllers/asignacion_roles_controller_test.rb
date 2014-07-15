require 'test_helper'

class AsignacionRolesControllerTest < ActionController::TestCase
  setup do
    @asignacion_rol = asignacion_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asignacion_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asignacion_rol" do
    assert_difference('AsignacionRol.count') do
      post :create, asignacion_rol: { esActual: @asignacion_rol.esActual, fechaCambioEstado: @asignacion_rol.fechaCambioEstado, proyecto_id: @asignacion_rol.proyecto_id, rol_id: @asignacion_rol.rol_id, usuario_id: @asignacion_rol.usuario_id }
    end

    assert_redirected_to asignacion_rol_path(assigns(:asignacion_rol))
  end

  test "should show asignacion_rol" do
    get :show, id: @asignacion_rol
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asignacion_rol
    assert_response :success
  end

  test "should update asignacion_rol" do
    patch :update, id: @asignacion_rol, asignacion_rol: { esActual: @asignacion_rol.esActual, fechaCambioEstado: @asignacion_rol.fechaCambioEstado, proyecto_id: @asignacion_rol.proyecto_id, rol_id: @asignacion_rol.rol_id, usuario_id: @asignacion_rol.usuario_id }
    assert_redirected_to asignacion_rol_path(assigns(:asignacion_rol))
  end

  test "should destroy asignacion_rol" do
    assert_difference('AsignacionRol.count', -1) do
      delete :destroy, id: @asignacion_rol
    end

    assert_redirected_to asignacion_roles_path
  end
end
