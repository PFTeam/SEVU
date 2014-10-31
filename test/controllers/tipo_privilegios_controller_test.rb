require 'test_helper'

class TipoPrivilegiosControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @tipo_privilegio = tipo_privilegios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_privilegios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_privilegio" do
    assert_difference('TipoPrivilegio.count') do
      post :create, tipo_privilegio: { descripcion: @tipo_privilegio.descripcion, nombre: @tipo_privilegio.nombre }
    end

    assert_redirected_to tipo_privilegio_path(assigns(:tipo_privilegio))
  end

  test "should show tipo_privilegio" do
    get :show, id: @tipo_privilegio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_privilegio
    assert_response :success
  end

  test "should update tipo_privilegio" do
    patch :update, id: @tipo_privilegio, tipo_privilegio: { descripcion: @tipo_privilegio.descripcion, nombre: @tipo_privilegio.nombre }
    assert_redirected_to tipo_privilegio_path(assigns(:tipo_privilegio))
  end

  test "should destroy tipo_privilegio" do
    assert_difference('TipoPrivilegio.count', -1) do
      delete :destroy, id: @tipo_privilegio
    end

    assert_redirected_to tipo_privilegios_path
  end
end
