require 'test_helper'

class OrganizacionExternasControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @organizacion_externa = organizacion_externas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizacion_externas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organizacion_externa" do
    assert_difference('OrganizacionExterna.count') do
      post :create, organizacion_externa: { cargoResponsable: @organizacion_externa.cargoResponsable, cuit: @organizacion_externa.cuit, denominacion: @organizacion_externa.denominacion, direccion: @organizacion_externa.direccion, fax: @organizacion_externa.fax, nombreResponsable: @organizacion_externa.nombreResponsable, numeroContactoResponsable: @organizacion_externa.numeroContactoResponsable, sigla: @organizacion_externa.sigla, telefono: @organizacion_externa.telefono }
    end

    assert_redirected_to organizacion_externa_path(assigns(:organizacion_externa))
  end

  test "should show organizacion_externa" do
    get :show, id: @organizacion_externa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organizacion_externa
    assert_response :success
  end

  test "should update organizacion_externa" do
    patch :update, id: @organizacion_externa, organizacion_externa: { cargoResponsable: @organizacion_externa.cargoResponsable, cuit: @organizacion_externa.cuit, denominacion: @organizacion_externa.denominacion, direccion: @organizacion_externa.direccion, fax: @organizacion_externa.fax, nombreResponsable: @organizacion_externa.nombreResponsable, numeroContactoResponsable: @organizacion_externa.numeroContactoResponsable, sigla: @organizacion_externa.sigla, telefono: @organizacion_externa.telefono }
    assert_redirected_to organizacion_externa_path(assigns(:organizacion_externa))
  end

  test "should destroy organizacion_externa" do
    assert_difference('OrganizacionExterna.count', -1) do
      delete :destroy, id: @organizacion_externa
    end

    assert_redirected_to organizacion_externas_path
  end
end
