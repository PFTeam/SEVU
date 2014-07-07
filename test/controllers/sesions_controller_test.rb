require 'test_helper'

class SesionsControllerTest < ActionController::TestCase
  setup do
    @sesion = sesions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sesions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sesion" do
    assert_difference('Sesion.count') do
      post :create, sesion: { fechaFin: @sesion.fechaFin, fechaInicio: @sesion.fechaInicio, usuario_id: @sesion.usuario_id }
    end

    assert_redirected_to sesion_path(assigns(:sesion))
  end

  test "should show sesion" do
    get :show, id: @sesion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sesion
    assert_response :success
  end

  test "should update sesion" do
    patch :update, id: @sesion, sesion: { fechaFin: @sesion.fechaFin, fechaInicio: @sesion.fechaInicio, usuario_id: @sesion.usuario_id }
    assert_redirected_to sesion_path(assigns(:sesion))
  end

  test "should destroy sesion" do
    assert_difference('Sesion.count', -1) do
      delete :destroy, id: @sesion
    end

    assert_redirected_to sesions_path
  end
end
