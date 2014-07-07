require 'test_helper'

class InformeGastosControllerTest < ActionController::TestCase
  setup do
    @informe_gasto = informe_gastos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:informe_gastos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create informe_gasto" do
    assert_difference('InformeGasto.count') do
      post :create, informe_gasto: { montoTotal: @informe_gasto.montoTotal, proyecto_id: @informe_gasto.proyecto_id }
    end

    assert_redirected_to informe_gasto_path(assigns(:informe_gasto))
  end

  test "should show informe_gasto" do
    get :show, id: @informe_gasto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @informe_gasto
    assert_response :success
  end

  test "should update informe_gasto" do
    patch :update, id: @informe_gasto, informe_gasto: { montoTotal: @informe_gasto.montoTotal, proyecto_id: @informe_gasto.proyecto_id }
    assert_redirected_to informe_gasto_path(assigns(:informe_gasto))
  end

  test "should destroy informe_gasto" do
    assert_difference('InformeGasto.count', -1) do
      delete :destroy, id: @informe_gasto
    end

    assert_redirected_to informe_gastos_path
  end
end
