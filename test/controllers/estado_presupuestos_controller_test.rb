require 'test_helper'

class EstadoPresupuestosControllerTest < ActionController::TestCase
  setup do
    @estado_presupuesto = estado_presupuestos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estado_presupuestos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estado_presupuesto" do
    assert_difference('EstadoPresupuesto.count') do
      post :create, estado_presupuesto: { nombre: @estado_presupuesto.nombre }
    end

    assert_redirected_to estado_presupuesto_path(assigns(:estado_presupuesto))
  end

  test "should show estado_presupuesto" do
    get :show, id: @estado_presupuesto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estado_presupuesto
    assert_response :success
  end

  test "should update estado_presupuesto" do
    patch :update, id: @estado_presupuesto, estado_presupuesto: { nombre: @estado_presupuesto.nombre }
    assert_redirected_to estado_presupuesto_path(assigns(:estado_presupuesto))
  end

  test "should destroy estado_presupuesto" do
    assert_difference('EstadoPresupuesto.count', -1) do
      delete :destroy, id: @estado_presupuesto
    end

    assert_redirected_to estado_presupuestos_path
  end
end
