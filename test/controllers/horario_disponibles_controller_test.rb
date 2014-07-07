require 'test_helper'

class HorarioDisponiblesControllerTest < ActionController::TestCase
  setup do
    @horario_disponible = horario_disponibles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:horario_disponibles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create horario_disponible" do
    assert_difference('HorarioDisponible.count') do
      post :create, horario_disponible: { diaSemana: @horario_disponible.diaSemana, horaDesde: @horario_disponible.horaDesde, horaHasta: @horario_disponible.horaHasta, voluntario_id: @horario_disponible.voluntario_id }
    end

    assert_redirected_to horario_disponible_path(assigns(:horario_disponible))
  end

  test "should show horario_disponible" do
    get :show, id: @horario_disponible
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @horario_disponible
    assert_response :success
  end

  test "should update horario_disponible" do
    patch :update, id: @horario_disponible, horario_disponible: { diaSemana: @horario_disponible.diaSemana, horaDesde: @horario_disponible.horaDesde, horaHasta: @horario_disponible.horaHasta, voluntario_id: @horario_disponible.voluntario_id }
    assert_redirected_to horario_disponible_path(assigns(:horario_disponible))
  end

  test "should destroy horario_disponible" do
    assert_difference('HorarioDisponible.count', -1) do
      delete :destroy, id: @horario_disponible
    end

    assert_redirected_to horario_disponibles_path
  end
end
