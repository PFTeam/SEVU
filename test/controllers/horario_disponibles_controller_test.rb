require 'test_helper'

class HorarioDisponiblesControllerTest < ActionController::TestCase
  setup do
    @horario_disponibl = horario_disponibles(:one)
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

  test "should create horario_disponibl" do
    assert_difference('HorarioDisponible.count') do
      post :create, horario_disponibl: { diaSemana: @horario_disponibl.diaSemana, horaDesde: @horario_disponibl.horaDesde, horaHasta: @horario_disponibl.horaHasta, voluntario_id: @horario_disponibl.voluntario_id }
    end

    assert_redirected_to horario_disponibl_path(assigns(:horario_disponibl))
  end

  test "should show horario_disponibl" do
    get :show, id: @horario_disponibl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @horario_disponibl
    assert_response :success
  end

  test "should update horario_disponibl" do
    patch :update, id: @horario_disponibl, horario_disponibl: { diaSemana: @horario_disponibl.diaSemana, horaDesde: @horario_disponibl.horaDesde, horaHasta: @horario_disponibl.horaHasta, voluntario_id: @horario_disponibl.voluntario_id }
    assert_redirected_to horario_disponibl_path(assigns(:horario_disponibl))
  end

  test "should destroy horario_disponibl" do
    assert_difference('HorarioDisponible.count', -1) do
      delete :destroy, id: @horario_disponibl
    end

    assert_redirected_to horario_disponibles_path
  end
end
