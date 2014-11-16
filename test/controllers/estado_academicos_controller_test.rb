require 'test_helper'

class EstadoAcademicosControllerTest < ActionController::TestCase
  setup do
    @estado_academico = estado_academicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estado_academicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estado_academico" do
    assert_difference('EstadoAcademico.count') do
      post :create, estado_academico: { cantidad_materias_aprobadas: @estado_academico.cantidad_materias_aprobadas, cantidad_materias_cursando: @estado_academico.cantidad_materias_cursando, cantidad_materias_regulares: @estado_academico.cantidad_materias_regulares, usuario_id: @estado_academico.usuario_id }
    end

    assert_redirected_to estado_academico_path(assigns(:estado_academico))
  end

  test "should show estado_academico" do
    get :show, id: @estado_academico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estado_academico
    assert_response :success
  end

  test "should update estado_academico" do
    patch :update, id: @estado_academico, estado_academico: { cantidad_materias_aprobadas: @estado_academico.cantidad_materias_aprobadas, cantidad_materias_cursando: @estado_academico.cantidad_materias_cursando, cantidad_materias_regulares: @estado_academico.cantidad_materias_regulares, usuario_id: @estado_academico.usuario_id }
    assert_redirected_to estado_academico_path(assigns(:estado_academico))
  end

  test "should destroy estado_academico" do
    assert_difference('EstadoAcademico.count', -1) do
      delete :destroy, id: @estado_academico
    end

    assert_redirected_to estado_academicos_path
  end
end
