require 'test_helper'

class PrivilegiosControllerTest < ActionController::TestCase
  setup do
    @privilegio = privilegios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:privilegios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create privilegio" do
    assert_difference('Privilegio.count') do
      post :create, privilegio: { descripcion: @privilegio.descripcion, nombre: @privilegio.nombre, tipo_privilegio_id: @privilegio.tipo_privilegio_id }
    end

    assert_redirected_to privilegio_path(assigns(:privilegio))
  end

  test "should show privilegio" do
    get :show, id: @privilegio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @privilegio
    assert_response :success
  end

  test "should update privilegio" do
    patch :update, id: @privilegio, privilegio: { descripcion: @privilegio.descripcion, nombre: @privilegio.nombre, tipo_privilegio_id: @privilegio.tipo_privilegio_id }
    assert_redirected_to privilegio_path(assigns(:privilegio))
  end

  test "should destroy privilegio" do
    assert_difference('Privilegio.count', -1) do
      delete :destroy, id: @privilegio
    end

    assert_redirected_to privilegios_path
  end
end
