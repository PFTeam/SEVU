require 'test_helper'

class AsistenciaEventosControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @asistencia_evento = asistencia_eventos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asistencia_eventos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asistencia_evento" do
    assert_difference('AsistenciaEvento.count') do
      post :create, asistencia_evento: { evento_publico_id: @asistencia_evento.evento_publico_id, fechaCreacion: @asistencia_evento.fechaCreacion, usuario_id: @asistencia_evento.usuario_id }
    end

    assert_redirected_to asistencia_evento_path(assigns(:asistencia_evento))
  end

  test "should show asistencia_evento" do
    get :show, id: @asistencia_evento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asistencia_evento
    assert_response :success
  end

  test "should update asistencia_evento" do
    patch :update, id: @asistencia_evento, asistencia_evento: { evento_publico_id: @asistencia_evento.evento_publico_id, fechaCreacion: @asistencia_evento.fechaCreacion, usuario_id: @asistencia_evento.usuario_id }
    assert_redirected_to asistencia_evento_path(assigns(:asistencia_evento))
  end

  test "should destroy asistencia_evento" do
    assert_difference('AsistenciaEvento.count', -1) do
      delete :destroy, id: @asistencia_evento
    end

    assert_redirected_to asistencia_eventos_path
  end
end
