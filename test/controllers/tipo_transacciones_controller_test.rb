require 'test_helper'

class TipoTransaccionesControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @tipo_transaccion = tipo_transacciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_transacciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_transaccion" do
    assert_difference('TipoTransaccion.count') do
      post :create, tipo_transaccion: { descripcion: @tipo_transaccion.descripcion }
    end

    assert_redirected_to tipo_transaccion_path(assigns(:tipo_transaccion))
  end

  test "should show tipo_transaccion" do
    get :show, id: @tipo_transaccion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_transaccion
    assert_response :success
  end

  test "should update tipo_transaccion" do
    patch :update, id: @tipo_transaccion, tipo_transaccion: { descripcion: @tipo_transaccion.descripcion }
    assert_redirected_to tipo_transaccion_path(assigns(:tipo_transaccion))
  end

  test "should destroy tipo_transaccion" do
    assert_difference('TipoTransaccion.count', -1) do
      delete :destroy, id: @tipo_transaccion
    end

    assert_redirected_to tipo_transacciones_path
  end
end
