require 'test_helper'

class HistorialEstadoProyectosControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @historial_estado_proyecto = historial_estado_proyectos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historial_estado_proyectos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historial_estado_proyecto" do
    assert_difference('HistorialEstadoProyecto.count') do
      post :create, historial_estado_proyecto: { esActual: @historial_estado_proyecto.esActual, estado_proyecto_id: @historial_estado_proyecto.estado_proyecto_id, fechaCambioEstado: @historial_estado_proyecto.fechaCambioEstado, proyecto_id: @historial_estado_proyecto.proyecto_id }
    end

    assert_redirected_to historial_estado_proyecto_path(assigns(:historial_estado_proyecto))
  end

  test "should show historial_estado_proyecto" do
    get :show, id: @historial_estado_proyecto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historial_estado_proyecto
    assert_response :success
  end

  test "should update historial_estado_proyecto" do
    patch :update, id: @historial_estado_proyecto, historial_estado_proyecto: { esActual: @historial_estado_proyecto.esActual, estado_proyecto_id: @historial_estado_proyecto.estado_proyecto_id, fechaCambioEstado: @historial_estado_proyecto.fechaCambioEstado, proyecto_id: @historial_estado_proyecto.proyecto_id }
    assert_redirected_to historial_estado_proyecto_path(assigns(:historial_estado_proyecto))
  end

  test "should destroy historial_estado_proyecto" do
    assert_difference('HistorialEstadoProyecto.count', -1) do
      delete :destroy, id: @historial_estado_proyecto
    end

    assert_redirected_to historial_estado_proyectos_path
  end
end
