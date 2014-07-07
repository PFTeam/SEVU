require 'test_helper'

class AsignacionRolProyectosControllerTest < ActionController::TestCase
  setup do
    @asignacion_rol_proyecto = asignacion_rol_proyectos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asignacion_rol_proyectos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asignacion_rol_proyecto" do
    assert_difference('AsignacionRolProyecto.count') do
      post :create, asignacion_rol_proyecto: { esActual: @asignacion_rol_proyecto.esActual, fechaCambioEstado: @asignacion_rol_proyecto.fechaCambioEstado, proyecto_id: @asignacion_rol_proyecto.proyecto_id, rol_id: @asignacion_rol_proyecto.rol_id, usuario_id: @asignacion_rol_proyecto.usuario_id }
    end

    assert_redirected_to asignacion_rol_proyecto_path(assigns(:asignacion_rol_proyecto))
  end

  test "should show asignacion_rol_proyecto" do
    get :show, id: @asignacion_rol_proyecto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asignacion_rol_proyecto
    assert_response :success
  end

  test "should update asignacion_rol_proyecto" do
    patch :update, id: @asignacion_rol_proyecto, asignacion_rol_proyecto: { esActual: @asignacion_rol_proyecto.esActual, fechaCambioEstado: @asignacion_rol_proyecto.fechaCambioEstado, proyecto_id: @asignacion_rol_proyecto.proyecto_id, rol_id: @asignacion_rol_proyecto.rol_id, usuario_id: @asignacion_rol_proyecto.usuario_id }
    assert_redirected_to asignacion_rol_proyecto_path(assigns(:asignacion_rol_proyecto))
  end

  test "should destroy asignacion_rol_proyecto" do
    assert_difference('AsignacionRolProyecto.count', -1) do
      delete :destroy, id: @asignacion_rol_proyecto
    end

    assert_redirected_to asignacion_rol_proyectos_path
  end
end
