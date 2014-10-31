require 'test_helper'

class ConceptoGastosControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @concepto_gasto = concepto_gastos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:concepto_gastos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create concepto_gasto" do
    assert_difference('ConceptoGasto.count') do
      post :create, concepto_gasto: { descripcion: @concepto_gasto.descripcion, titulo: @concepto_gasto.titulo }
    end

    assert_redirected_to concepto_gasto_path(assigns(:concepto_gasto))
  end

  test "should show concepto_gasto" do
    get :show, id: @concepto_gasto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @concepto_gasto
    assert_response :success
  end

  test "should update concepto_gasto" do
    patch :update, id: @concepto_gasto, concepto_gasto: { descripcion: @concepto_gasto.descripcion, titulo: @concepto_gasto.titulo }
    assert_redirected_to concepto_gasto_path(assigns(:concepto_gasto))
  end

  test "should destroy concepto_gasto" do
    assert_difference('ConceptoGasto.count', -1) do
      delete :destroy, id: @concepto_gasto
    end

    assert_redirected_to concepto_gastos_path
  end
end
