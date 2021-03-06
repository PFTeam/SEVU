require 'test_helper'

class ActividadesControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @actividad = actividades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actividades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actividad" do
    assert_difference('Actividad.count') do
      post :create, actividad: { descripcion: @actividad.descripcion, duracion: @actividad.duracion, duracionReal: @actividad.duracionReal, estrategiasIntervencion: @actividad.estrategiasIntervencion, fechaEstimadaInicio: @actividad.fechaEstimadaInicio, fechaRealInicio: @actividad.fechaRealInicio, mecanismoEvaluacion: @actividad.mecanismoEvaluacion, metodologiasIntervencion: @actividad.metodologiasIntervencion, nombre: @actividad.nombre, objetivo_especifico_id: @actividad.objetivo_especifico_id, proyecto_id: @actividad.proyecto_id, resultadosEsperados: @actividad.resultadosEsperados, tipo_actividad_id: @actividad.tipo_actividad_id }
    end

    assert_redirected_to actividad_path(assigns(:actividad))
  end

  test "should show actividad" do
    get :show, id: @actividad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actividad
    assert_response :success
  end

  test "should update actividad" do
    patch :update, id: @actividad, actividad: { descripcion: @actividad.descripcion, duracion: @actividad.duracion, duracionReal: @actividad.duracionReal, estrategiasIntervencion: @actividad.estrategiasIntervencion, fechaEstimadaInicio: @actividad.fechaEstimadaInicio, fechaRealInicio: @actividad.fechaRealInicio, mecanismoEvaluacion: @actividad.mecanismoEvaluacion, metodologiasIntervencion: @actividad.metodologiasIntervencion, nombre: @actividad.nombre, objetivo_especifico_id: @actividad.objetivo_especifico_id, proyecto_id: @actividad.proyecto_id, resultadosEsperados: @actividad.resultadosEsperados, tipo_actividad_id: @actividad.tipo_actividad_id }
    assert_redirected_to actividad_path(assigns(:actividad))
  end

  test "should destroy actividad" do
    assert_difference('Actividad.count', -1) do
      delete :destroy, id: @actividad
    end

    assert_redirected_to actividades_path
  end
end
