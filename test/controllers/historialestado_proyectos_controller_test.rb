require 'test_helper'

class HistorialestadoProyectosControllerTest < ActionController::TestCase
  setup do
    @historialestado_proyecto = historialestado_proyectos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historialestado_proyectos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historialestado_proyecto" do
    assert_difference('HistorialestadoProyecto.count') do
      post :create, historialestado_proyecto: { esActual: @historialestado_proyecto.esActual, estado_proyecto_id: @historialestado_proyecto.estado_proyecto_id, fechaCambioEstado: @historialestado_proyecto.fechaCambioEstado, proyecto_id: @historialestado_proyecto.proyecto_id }
    end

    assert_redirected_to historialestado_proyecto_path(assigns(:historialestado_proyecto))
  end

  test "should show historialestado_proyecto" do
    get :show, id: @historialestado_proyecto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historialestado_proyecto
    assert_response :success
  end

  test "should update historialestado_proyecto" do
    patch :update, id: @historialestado_proyecto, historialestado_proyecto: { esActual: @historialestado_proyecto.esActual, estado_proyecto_id: @historialestado_proyecto.estado_proyecto_id, fechaCambioEstado: @historialestado_proyecto.fechaCambioEstado, proyecto_id: @historialestado_proyecto.proyecto_id }
    assert_redirected_to historialestado_proyecto_path(assigns(:historialestado_proyecto))
  end

  test "should destroy historialestado_proyecto" do
    assert_difference('HistorialestadoProyecto.count', -1) do
      delete :destroy, id: @historialestado_proyecto
    end

    assert_redirected_to historialestado_proyectos_path
  end
end
