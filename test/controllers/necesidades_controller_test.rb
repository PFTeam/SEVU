require 'test_helper'

class NecesidadesControllerTest < ActionController::TestCase
  setup do
    @necesidad = necesidades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:necesidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create necesidad" do
    assert_difference('Necesidad.count') do
      post :create, necesidad: { ambitoAplicacion: @necesidad.ambitoAplicacion, descripcion: @necesidad.descripcion, fechaCreacion: @necesidad.fechaCreacion, usuario_id: @necesidad.usuario_id }
    end

    assert_redirected_to necesidad_path(assigns(:necesidad))
  end

  test "should show necesidad" do
    get :show, id: @necesidad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @necesidad
    assert_response :success
  end

  test "should update necesidad" do
    patch :update, id: @necesidad, necesidad: { ambitoAplicacion: @necesidad.ambitoAplicacion, descripcion: @necesidad.descripcion, fechaCreacion: @necesidad.fechaCreacion, usuario_id: @necesidad.usuario_id }
    assert_redirected_to necesidad_path(assigns(:necesidad))
  end

  test "should destroy necesidad" do
    assert_difference('Necesidad.count', -1) do
      delete :destroy, id: @necesidad
    end

    assert_redirected_to necesidades_path
  end
end
