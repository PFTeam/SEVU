require 'test_helper'

class PostulacionVoluntariadosControllerTest < ActionController::TestCase
  setup do
    @postulacion_voluntariado = postulacion_voluntariados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postulacion_voluntariados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postulacion_voluntariado" do
    assert_difference('PostulacionVoluntariado.count') do
      post :create, postulacion_voluntariado: { aceptado: @postulacion_voluntariado.aceptado, fechaPostulacion: @postulacion_voluntariado.fechaPostulacion, proyecto_id: @postulacion_voluntariado.proyecto_id, usuario_id: @postulacion_voluntariado.usuario_id }
    end

    assert_redirected_to postulacion_voluntariado_path(assigns(:postulacion_voluntariado))
  end

  test "should show postulacion_voluntariado" do
    get :show, id: @postulacion_voluntariado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postulacion_voluntariado
    assert_response :success
  end

  test "should update postulacion_voluntariado" do
    patch :update, id: @postulacion_voluntariado, postulacion_voluntariado: { aceptado: @postulacion_voluntariado.aceptado, fechaPostulacion: @postulacion_voluntariado.fechaPostulacion, proyecto_id: @postulacion_voluntariado.proyecto_id, usuario_id: @postulacion_voluntariado.usuario_id }
    assert_redirected_to postulacion_voluntariado_path(assigns(:postulacion_voluntariado))
  end

  test "should destroy postulacion_voluntariado" do
    assert_difference('PostulacionVoluntariado.count', -1) do
      delete :destroy, id: @postulacion_voluntariado
    end

    assert_redirected_to postulacion_voluntariados_path
  end
end
