require 'test_helper'

class EstadoProyectosControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @estado_proyecto = estado_proyectos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estado_proyectos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estado_proyecto" do
    assert_difference('EstadoProyecto.count') do
      post :create, estado_proyecto: { nombre: @estado_proyecto.nombre }
    end

    assert_redirected_to estado_proyecto_path(assigns(:estado_proyecto))
  end

  test "should show estado_proyecto" do
    get :show, id: @estado_proyecto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estado_proyecto
    assert_response :success
  end

  test "should update estado_proyecto" do
    patch :update, id: @estado_proyecto, estado_proyecto: { nombre: @estado_proyecto.nombre }
    assert_redirected_to estado_proyecto_path(assigns(:estado_proyecto))
  end

  test "should destroy estado_proyecto" do
    assert_difference('EstadoProyecto.count', -1) do
      delete :destroy, id: @estado_proyecto
    end

    assert_redirected_to estado_proyectos_path
  end
end
