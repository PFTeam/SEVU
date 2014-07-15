require 'test_helper'

class AsignacionRolPredefinidosControllerTest < ActionController::TestCase
  setup do
    @asignacion_rol_predefinido = asignacion_rol_predefinidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asignacion_rol_predefinidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asignacion_rol_predefinido" do
    assert_difference('AsignacionRolPredefinido.count') do
      post :create, asignacion_rol_predefinido: { esActual: @asignacion_rol_predefinido.esActual, fechaAsignacion: @asignacion_rol_predefinido.fechaAsignacion, privilegio_id: @asignacion_rol_predefinido.privilegio_id, rol_id: @asignacion_rol_predefinido.rol_id }
    end

    assert_redirected_to asignacion_rol_predefinido_path(assigns(:asignacion_rol_predefinido))
  end

  test "should show asignacion_rol_predefinido" do
    get :show, id: @asignacion_rol_predefinido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asignacion_rol_predefinido
    assert_response :success
  end

  test "should update asignacion_rol_predefinido" do
    patch :update, id: @asignacion_rol_predefinido, asignacion_rol_predefinido: { esActual: @asignacion_rol_predefinido.esActual, fechaAsignacion: @asignacion_rol_predefinido.fechaAsignacion, privilegio_id: @asignacion_rol_predefinido.privilegio_id, rol_id: @asignacion_rol_predefinido.rol_id }
    assert_redirected_to asignacion_rol_predefinido_path(assigns(:asignacion_rol_predefinido))
  end

  test "should destroy asignacion_rol_predefinido" do
    assert_difference('AsignacionRolPredefinido.count', -1) do
      delete :destroy, id: @asignacion_rol_predefinido
    end

    assert_redirected_to asignacion_rol_predefinidos_path
  end
end
