require 'test_helper'

class TipoHabilidadsControllerTest < ActionController::TestCase
  setup do
    @tipo_habilidad = tipo_habilidads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_habilidads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_habilidad" do
    assert_difference('TipoHabilidad.count') do
      post :create, tipo_habilidad: { descripcion: @tipo_habilidad.descripcion, nombre: @tipo_habilidad.nombre }
    end

    assert_redirected_to tipo_habilidad_path(assigns(:tipo_habilidad))
  end

  test "should show tipo_habilidad" do
    get :show, id: @tipo_habilidad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_habilidad
    assert_response :success
  end

  test "should update tipo_habilidad" do
    patch :update, id: @tipo_habilidad, tipo_habilidad: { descripcion: @tipo_habilidad.descripcion, nombre: @tipo_habilidad.nombre }
    assert_redirected_to tipo_habilidad_path(assigns(:tipo_habilidad))
  end

  test "should destroy tipo_habilidad" do
    assert_difference('TipoHabilidad.count', -1) do
      delete :destroy, id: @tipo_habilidad
    end

    assert_redirected_to tipo_habilidads_path
  end
end
