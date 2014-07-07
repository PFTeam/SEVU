require 'test_helper'

class ReportesControllerTest < ActionController::TestCase
  setup do
    @report = reportes(:one)
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
      post :create, report: { asignacion_actividad_id: @report.asignacion_actividad_id, descripcion: @report.descripcion, fechaCreacion: @report.fechaCreacion }
    end

    assert_redirected_to report_path(assigns(:report))
  end

  test "should show report" do
    get :show, id: @report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report
    assert_response :success
  end

  test "should update report" do
    patch :update, id: @report, report: { asignacion_actividad_id: @report.asignacion_actividad_id, descripcion: @report.descripcion, fechaCreacion: @report.fechaCreacion }
    assert_redirected_to report_path(assigns(:report))
  end

  test "should destroy report" do
    assert_difference('Reporte.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to reportes_path
  end
end
