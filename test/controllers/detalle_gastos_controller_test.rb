require 'test_helper'

class DetalleGastosControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @detalle_gasto = detalle_gastos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalle_gastos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle_gasto" do
    assert_difference('DetalleGasto.count') do
      post :create, detalle_gasto: { comprobante_id: @detalle_gasto.comprobante_id, concepto_gasto_id: @detalle_gasto.concepto_gasto_id, descripcion: @detalle_gasto.descripcion, informe_gastos_id: @detalle_gasto.informe_gastos_id, monto: @detalle_gasto.monto, titulo: @detalle_gasto.titulo, voluntario_id: @detalle_gasto.voluntario_id }
    end

    assert_redirected_to detalle_gasto_path(assigns(:detalle_gasto))
  end

  test "should show detalle_gasto" do
    get :show, id: @detalle_gasto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalle_gasto
    assert_response :success
  end

  test "should update detalle_gasto" do
    patch :update, id: @detalle_gasto, detalle_gasto: { comprobante_id: @detalle_gasto.comprobante_id, concepto_gasto_id: @detalle_gasto.concepto_gasto_id, descripcion: @detalle_gasto.descripcion, informe_gastos_id: @detalle_gasto.informe_gastos_id, monto: @detalle_gasto.monto, titulo: @detalle_gasto.titulo, voluntario_id: @detalle_gasto.voluntario_id }
    assert_redirected_to detalle_gasto_path(assigns(:detalle_gasto))
  end

  test "should destroy detalle_gasto" do
    assert_difference('DetalleGasto.count', -1) do
      delete :destroy, id: @detalle_gasto
    end

    assert_redirected_to detalle_gastos_path
  end
end
