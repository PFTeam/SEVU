require 'test_helper'

class AsignacionRolSistemasControllerTest < ActionController::TestCase
  setup do
    @asignacion_rol_sistema = asignacion_rol_sistemas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asignacion_rol_sistemas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asignacion_rol_sistema" do
    assert_difference('AsignacionRolSistema.count') do
      post :create, asignacion_rol_sistema: { descripcion: @asignacion_rol_sistema.descripcion, esActual: @asignacion_rol_sistema.esActual, fechaAsignacion: @asignacion_rol_sistema.fechaAsignacion, rol_id: @asignacion_rol_sistema.rol_id, usuario_id: @asignacion_rol_sistema.usuario_id }
    end

    assert_redirected_to asignacion_rol_sistema_path(assigns(:asignacion_rol_sistema))
  end

  test "should show asignacion_rol_sistema" do
    get :show, id: @asignacion_rol_sistema
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asignacion_rol_sistema
    assert_response :success
  end

  test "should update asignacion_rol_sistema" do
    patch :update, id: @asignacion_rol_sistema, asignacion_rol_sistema: { descripcion: @asignacion_rol_sistema.descripcion, esActual: @asignacion_rol_sistema.esActual, fechaAsignacion: @asignacion_rol_sistema.fechaAsignacion, rol_id: @asignacion_rol_sistema.rol_id, usuario_id: @asignacion_rol_sistema.usuario_id }
    assert_redirected_to asignacion_rol_sistema_path(assigns(:asignacion_rol_sistema))
  end

  test "should destroy asignacion_rol_sistema" do
    assert_difference('AsignacionRolSistema.count', -1) do
      delete :destroy, id: @asignacion_rol_sistema
    end

    assert_redirected_to asignacion_rol_sistemas_path
  end
end
