require 'test_helper'

class ActividadHabilidadsControllerTest < ActionController::TestCase
  setup do
    @actividad_habilidad = actividad_habilidads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actividad_habilidads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actividad_habilidad" do
    assert_difference('ActividadHabilidad.count') do
      post :create, actividad_habilidad: { actividad_id: @actividad_habilidad.actividad_id, habilidad_id: @actividad_habilidad.habilidad_id }
    end

    assert_redirected_to actividad_habilidad_path(assigns(:actividad_habilidad))
  end

  test "should show actividad_habilidad" do
    get :show, id: @actividad_habilidad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actividad_habilidad
    assert_response :success
  end

  test "should update actividad_habilidad" do
    patch :update, id: @actividad_habilidad, actividad_habilidad: { actividad_id: @actividad_habilidad.actividad_id, habilidad_id: @actividad_habilidad.habilidad_id }
    assert_redirected_to actividad_habilidad_path(assigns(:actividad_habilidad))
  end

  test "should destroy actividad_habilidad" do
    assert_difference('ActividadHabilidad.count', -1) do
      delete :destroy, id: @actividad_habilidad
    end

    assert_redirected_to actividad_habilidads_path
  end
end
