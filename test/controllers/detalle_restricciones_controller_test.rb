require 'test_helper'

class DetalleRestriccionesControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @detalle_restriccion = detalle_restricciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalle_restricciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle_restriccion" do
    assert_difference('DetalleRestriccion.count') do
      post :create, detalle_restriccion: { concepto_gasto_id: @detalle_restriccion.concepto_gasto_id, esActiva: @detalle_restriccion.esActiva, fechaDesde: @detalle_restriccion.fechaDesde, fechaHasta: @detalle_restriccion.fechaHasta, montoMax: @detalle_restriccion.montoMax, restriccion_id: @detalle_restriccion.restriccion_id }
    end

    assert_redirected_to detalle_restriccion_path(assigns(:detalle_restriccion))
  end

  test "should show detalle_restriccion" do
    get :show, id: @detalle_restriccion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalle_restriccion
    assert_response :success
  end

  test "should update detalle_restriccion" do
    patch :update, id: @detalle_restriccion, detalle_restriccion: { concepto_gasto_id: @detalle_restriccion.concepto_gasto_id, esActiva: @detalle_restriccion.esActiva, fechaDesde: @detalle_restriccion.fechaDesde, fechaHasta: @detalle_restriccion.fechaHasta, montoMax: @detalle_restriccion.montoMax, restriccion_id: @detalle_restriccion.restriccion_id }
    assert_redirected_to detalle_restriccion_path(assigns(:detalle_restriccion))
  end

  test "should destroy detalle_restriccion" do
    assert_difference('DetalleRestriccion.count', -1) do
      delete :destroy, id: @detalle_restriccion
    end

    assert_redirected_to detalle_restricciones_path
  end
end
