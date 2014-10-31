require 'test_helper'

class TipoProyectosControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @tipo_proyecto = tipo_proyectos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_proyectos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_proyecto" do
    assert_difference('TipoProyecto.count') do
      post :create, tipo_proyecto: { descripcion: @tipo_proyecto.descripcion, nombre: @tipo_proyecto.nombre }
    end

    assert_redirected_to tipo_proyecto_path(assigns(:tipo_proyecto))
  end

  test "should show tipo_proyecto" do
    get :show, id: @tipo_proyecto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_proyecto
    assert_response :success
  end

  test "should update tipo_proyecto" do
    patch :update, id: @tipo_proyecto, tipo_proyecto: { descripcion: @tipo_proyecto.descripcion, nombre: @tipo_proyecto.nombre }
    assert_redirected_to tipo_proyecto_path(assigns(:tipo_proyecto))
  end

  test "should destroy tipo_proyecto" do
    assert_difference('TipoProyecto.count', -1) do
      delete :destroy, id: @tipo_proyecto
    end

    assert_redirected_to tipo_proyectos_path
  end
end
