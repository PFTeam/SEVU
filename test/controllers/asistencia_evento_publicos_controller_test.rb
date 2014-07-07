require 'test_helper'

class AsistenciaEventoPublicosControllerTest < ActionController::TestCase
  setup do
    @asistencia_evento_publico = asistencia_evento_publicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asistencia_evento_publicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asistencia_evento_publico" do
    assert_difference('AsistenciaEventoPublico.count') do
      post :create, asistencia_evento_publico: { evento_publico_id: @asistencia_evento_publico.evento_publico_id, fechaCreacion: @asistencia_evento_publico.fechaCreacion, usuario_id: @asistencia_evento_publico.usuario_id }
    end

    assert_redirected_to asistencia_evento_publico_path(assigns(:asistencia_evento_publico))
  end

  test "should show asistencia_evento_publico" do
    get :show, id: @asistencia_evento_publico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asistencia_evento_publico
    assert_response :success
  end

  test "should update asistencia_evento_publico" do
    patch :update, id: @asistencia_evento_publico, asistencia_evento_publico: { evento_publico_id: @asistencia_evento_publico.evento_publico_id, fechaCreacion: @asistencia_evento_publico.fechaCreacion, usuario_id: @asistencia_evento_publico.usuario_id }
    assert_redirected_to asistencia_evento_publico_path(assigns(:asistencia_evento_publico))
  end

  test "should destroy asistencia_evento_publico" do
    assert_difference('AsistenciaEventoPublico.count', -1) do
      delete :destroy, id: @asistencia_evento_publico
    end

    assert_redirected_to asistencia_evento_publicos_path
  end
end
