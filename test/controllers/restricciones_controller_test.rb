require 'test_helper'

class RestriccionesControllerTest < ActionController::TestCase
  setup do
    @restriccion = restricciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restricciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restriccion" do
    assert_difference('Restriccion.count') do
      post :create, restriccion: { esActiva: @restriccion.esActiva, fechaDesde: @restriccion.fechaDesde, fechaHasta: @restriccion.fechaHasta, tipo_proyecto_id: @restriccion.tipo_proyecto_id }
    end

    assert_redirected_to restriccion_path(assigns(:restriccion))
  end

  test "should show restriccion" do
    get :show, id: @restriccion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restriccion
    assert_response :success
  end

  test "should update restriccion" do
    patch :update, id: @restriccion, restriccion: { esActiva: @restriccion.esActiva, fechaDesde: @restriccion.fechaDesde, fechaHasta: @restriccion.fechaHasta, tipo_proyecto_id: @restriccion.tipo_proyecto_id }
    assert_redirected_to restriccion_path(assigns(:restriccion))
  end

  test "should destroy restriccion" do
    assert_difference('Restriccion.count', -1) do
      delete :destroy, id: @restriccion
    end

    assert_redirected_to restricciones_path
  end
end
