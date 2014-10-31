require 'test_helper'

class AsignacionActividadesControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @asignacion_actividad = asignacion_actividades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asignacion_actividades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asignacion_actividad" do
    assert_difference('AsignacionActividad.count') do
      post :create, asignacion_actividad: { actividad_id: @asignacion_actividad.actividad_id,  usuario_id: @asignacion_actividad.usuario_id, vigente: @asignacion_actividad.vigente }
    end

    assert_redirected_to asignacion_actividad_path(assigns(:asignacion_actividad))
  end

  test "should show asignacion_actividad" do
    get :show, id: @asignacion_actividad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asignacion_actividad
    assert_response :success
  end

  test "should update asignacion_actividad" do
    patch :update, id: @asignacion_actividad, asignacion_actividad: { actividad_id: @asignacion_actividad.actividad_id,  usuario_id: @asignacion_actividad.usuario_id, vigente: @asignacion_actividad.vigente }
    assert_redirected_to asignacion_actividad_path(assigns(:asignacion_actividad))
  end

  test "should destroy asignacion_actividad" do
    assert_difference('AsignacionActividad.count', -1) do
      delete :destroy, id: @asignacion_actividad
    end

    assert_redirected_to asignacion_actividades_path
  end
end
