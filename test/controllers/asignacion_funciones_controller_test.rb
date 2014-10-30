require 'test_helper'

class AsignacionFuncionesControllerTest < ActionController::TestCase
	include Devise::TestHelpers

  setup do
    @asignacion_funcion = asignacion_funciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asignacion_funciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asignacion_funcion" do
    assert_difference('AsignacionFuncion.count') do
      post :create, asignacion_funcion: { descripcion: @asignacion_funcion.descripcion, esActual: @asignacion_funcion.esActual,  rol_id: @asignacion_funcion.rol_id, usuario_id: @asignacion_funcion.usuario_id }
    end

    assert_redirected_to asignacion_funcion_path(assigns(:asignacion_funcion))
  end

  test "should show asignacion_funcion" do
    get :show, id: @asignacion_funcion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asignacion_funcion
    assert_response :success
  end

  test "should update asignacion_funcion" do
    patch :update, id: @asignacion_funcion, asignacion_funcion: { descripcion: @asignacion_funcion.descripcion, esActual: @asignacion_funcion.esActual,  rol_id: @asignacion_funcion.rol_id, usuario_id: @asignacion_funcion.usuario_id }
    assert_redirected_to asignacion_funcion_path(assigns(:asignacion_funcion))
  end

  test "should destroy asignacion_funcion" do
    assert_difference('AsignacionFuncion.count', -1) do
      delete :destroy, id: @asignacion_funcion
    end

    assert_redirected_to asignacion_funciones_path
  end
end
