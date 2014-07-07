require 'test_helper'

class HistorialEstadoPresupuestosControllerTest < ActionController::TestCase
  setup do
    @historial_estado_presupuesto = historial_estado_presupuestos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historial_estado_presupuestos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historial_estado_presupuesto" do
    assert_difference('HistorialEstadoPresupuesto.count') do
      post :create, historial_estado_presupuesto: { esActual: @historial_estado_presupuesto.esActual, estado_presupuesto_id: @historial_estado_presupuesto.estado_presupuesto_id, fechaCambioEstado: @historial_estado_presupuesto.fechaCambioEstado, presupuesto_id: @historial_estado_presupuesto.presupuesto_id }
    end

    assert_redirected_to historial_estado_presupuesto_path(assigns(:historial_estado_presupuesto))
  end

  test "should show historial_estado_presupuesto" do
    get :show, id: @historial_estado_presupuesto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historial_estado_presupuesto
    assert_response :success
  end

  test "should update historial_estado_presupuesto" do
    patch :update, id: @historial_estado_presupuesto, historial_estado_presupuesto: { esActual: @historial_estado_presupuesto.esActual, estado_presupuesto_id: @historial_estado_presupuesto.estado_presupuesto_id, fechaCambioEstado: @historial_estado_presupuesto.fechaCambioEstado, presupuesto_id: @historial_estado_presupuesto.presupuesto_id }
    assert_redirected_to historial_estado_presupuesto_path(assigns(:historial_estado_presupuesto))
  end

  test "should destroy historial_estado_presupuesto" do
    assert_difference('HistorialEstadoPresupuesto.count', -1) do
      delete :destroy, id: @historial_estado_presupuesto
    end

    assert_redirected_to historial_estado_presupuestos_path
  end
end
