require 'test_helper'

class EventoPublicosControllerTest < ActionController::TestCase
  setup do
    @evento_publico = evento_publicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evento_publicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evento_publico" do
    assert_difference('EventoPublico.count') do
      post :create, evento_publico: { descripcion: @evento_publico.descripcion, fechaRealizacion: @evento_publico.fechaRealizacion, nombre: @evento_publico.nombre, usuario_id: @evento_publico.usuario_id }
    end

    assert_redirected_to evento_publico_path(assigns(:evento_publico))
  end

  test "should show evento_publico" do
    get :show, id: @evento_publico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evento_publico
    assert_response :success
  end

  test "should update evento_publico" do
    patch :update, id: @evento_publico, evento_publico: { descripcion: @evento_publico.descripcion, fechaRealizacion: @evento_publico.fechaRealizacion, nombre: @evento_publico.nombre, usuario_id: @evento_publico.usuario_id }
    assert_redirected_to evento_publico_path(assigns(:evento_publico))
  end

  test "should destroy evento_publico" do
    assert_difference('EventoPublico.count', -1) do
      delete :destroy, id: @evento_publico
    end

    assert_redirected_to evento_publicos_path
  end
end
