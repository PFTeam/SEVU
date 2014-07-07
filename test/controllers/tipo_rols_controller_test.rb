require 'test_helper'

class TipoRolsControllerTest < ActionController::TestCase
  setup do
    @tipo_rol = tipo_rols(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_rols)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_rol" do
    assert_difference('TipoRol.count') do
      post :create, tipo_rol: { descripcion: @tipo_rol.descripcion, nombre: @tipo_rol.nombre }
    end

    assert_redirected_to tipo_rol_path(assigns(:tipo_rol))
  end

  test "should show tipo_rol" do
    get :show, id: @tipo_rol
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_rol
    assert_response :success
  end

  test "should update tipo_rol" do
    patch :update, id: @tipo_rol, tipo_rol: { descripcion: @tipo_rol.descripcion, nombre: @tipo_rol.nombre }
    assert_redirected_to tipo_rol_path(assigns(:tipo_rol))
  end

  test "should destroy tipo_rol" do
    assert_difference('TipoRol.count', -1) do
      delete :destroy, id: @tipo_rol
    end

    assert_redirected_to tipo_rols_path
  end
end
