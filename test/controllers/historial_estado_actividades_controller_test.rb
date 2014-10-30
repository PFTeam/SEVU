require 'test_helper'

class HistorialEstadoActividadesControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @historial_estado_actividad = historial_estado_actividades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historial_estado_actividades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historial_estado_actividad" do
    assert_difference('HistorialEstadoActividad.count') do
      post :create, historial_estado_actividad: { actividad_id: @historial_estado_actividad.actividad_id, esActual: @historial_estado_actividad.esActual, estado_actividad_id: @historial_estado_actividad.estado_actividad_id, fechaCambioEstado: @historial_estado_actividad.fechaCambioEstado }
    end

    assert_redirected_to historial_estado_actividad_path(assigns(:historial_estado_actividad))
  end

  test "should show historial_estado_actividad" do
    get :show, id: @historial_estado_actividad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historial_estado_actividad
    assert_response :success
  end

  test "should update historial_estado_actividad" do
    patch :update, id: @historial_estado_actividad, historial_estado_actividad: { actividad_id: @historial_estado_actividad.actividad_id, esActual: @historial_estado_actividad.esActual, estado_actividad_id: @historial_estado_actividad.estado_actividad_id, fechaCambioEstado: @historial_estado_actividad.fechaCambioEstado }
    assert_redirected_to historial_estado_actividad_path(assigns(:historial_estado_actividad))
  end

  test "should destroy historial_estado_actividad" do
    assert_difference('HistorialEstadoActividad.count', -1) do
      delete :destroy, id: @historial_estado_actividad
    end

    assert_redirected_to historial_estado_actividades_path
  end
end
