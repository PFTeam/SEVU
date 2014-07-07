require 'test_helper'

class EstadoActividadesControllerTest < ActionController::TestCase
  setup do
    @estado_actividad = estado_actividades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estado_actividades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estado_actividad" do
    assert_difference('EstadoActividad.count') do
      post :create, estado_actividad: { nombre: @estado_actividad.nombre }
    end

    assert_redirected_to estado_actividad_path(assigns(:estado_actividad))
  end

  test "should show estado_actividad" do
    get :show, id: @estado_actividad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estado_actividad
    assert_response :success
  end

  test "should update estado_actividad" do
    patch :update, id: @estado_actividad, estado_actividad: { nombre: @estado_actividad.nombre }
    assert_redirected_to estado_actividad_path(assigns(:estado_actividad))
  end

  test "should destroy estado_actividad" do
    assert_difference('EstadoActividad.count', -1) do
      delete :destroy, id: @estado_actividad
    end

    assert_redirected_to estado_actividades_path
  end
end
