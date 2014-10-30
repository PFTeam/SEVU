require 'test_helper'

class PostulacionesControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @postulacion = postulaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postulaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postulacion" do
    assert_difference('Postulacion.count') do
      post :create, postulacion: { aceptado: @postulacion.aceptado, proyecto_id: @postulacion.proyecto_id, usuario_id: @postulacion.usuario_id }
    end

    assert_redirected_to postulacion_path(assigns(:postulacion))
  end

  test "should show postulacion" do
    get :show, id: @postulacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postulacion
    assert_response :success
  end

  test "should update postulacion" do
    patch :update, id: @postulacion, postulacion: { aceptado: @postulacion.aceptado, proyecto_id: @postulacion.proyecto_id, usuario_id: @postulacion.usuario_id }
    assert_redirected_to postulacion_path(assigns(:postulacion))
  end

  test "should destroy postulacion" do
    assert_difference('Postulacion.count', -1) do
      delete :destroy, id: @postulacion
    end

    assert_redirected_to postulaciones_path
  end
end
