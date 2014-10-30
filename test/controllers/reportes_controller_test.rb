require 'test_helper'

class ReportesControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @reporte = reportes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reportes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report" do
    assert_difference('Reporte.count') do
      post :create, reporte: { asignacion_actividad_id: @reporte.asignacion_actividad_id, descripcion: @reporte.descripcion}
    end

    assert_redirected_to reporte_path(assigns(:reporte))
  end

  test "should show report" do
    get :show, id: @reporte
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reporte
    assert_response :success
  end

  test "should update report" do
    patch :update, id: @reporte, reporte: { asignacion_actividad_id: @reporte.asignacion_actividad_id, descripcion: @reporte.descripcion}
    assert_redirected_to reporte_path(assigns(:reporte))
  end

  test "should destroy report" do
    assert_difference('Reporte.count', -1) do
      delete :destroy, id: @reporte
    end

    assert_redirected_to reportes_path
  end
end
