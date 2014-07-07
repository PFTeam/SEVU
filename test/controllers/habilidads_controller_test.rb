require 'test_helper'

class HabilidadsControllerTest < ActionController::TestCase
  setup do
    @habilidad = habilidads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:habilidads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create habilidad" do
    assert_difference('Habilidad.count') do
      post :create, habilidad: { descripcion: @habilidad.descripcion, nombre: @habilidad.nombre, tipo_habilidad_id: @habilidad.tipo_habilidad_id }
    end

    assert_redirected_to habilidad_path(assigns(:habilidad))
  end

  test "should show habilidad" do
    get :show, id: @habilidad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @habilidad
    assert_response :success
  end

  test "should update habilidad" do
    patch :update, id: @habilidad, habilidad: { descripcion: @habilidad.descripcion, nombre: @habilidad.nombre, tipo_habilidad_id: @habilidad.tipo_habilidad_id }
    assert_redirected_to habilidad_path(assigns(:habilidad))
  end

  test "should destroy habilidad" do
    assert_difference('Habilidad.count', -1) do
      delete :destroy, id: @habilidad
    end

    assert_redirected_to habilidads_path
  end
end
