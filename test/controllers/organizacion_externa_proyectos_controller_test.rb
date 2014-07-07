require 'test_helper'

class OrganizacionExternaProyectosControllerTest < ActionController::TestCase
  setup do
    @organizacion_externa_proyecto = organizacion_externa_proyectos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizacion_externa_proyectos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organizacion_externa_proyecto" do
    assert_difference('OrganizacionExternaProyecto.count') do
      post :create, organizacion_externa_proyecto: { organizacion_externa_id: @organizacion_externa_proyecto.organizacion_externa_id, proyecto_id: @organizacion_externa_proyecto.proyecto_id }
    end

    assert_redirected_to organizacion_externa_proyecto_path(assigns(:organizacion_externa_proyecto))
  end

  test "should show organizacion_externa_proyecto" do
    get :show, id: @organizacion_externa_proyecto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organizacion_externa_proyecto
    assert_response :success
  end

  test "should update organizacion_externa_proyecto" do
    patch :update, id: @organizacion_externa_proyecto, organizacion_externa_proyecto: { organizacion_externa_id: @organizacion_externa_proyecto.organizacion_externa_id, proyecto_id: @organizacion_externa_proyecto.proyecto_id }
    assert_redirected_to organizacion_externa_proyecto_path(assigns(:organizacion_externa_proyecto))
  end

  test "should destroy organizacion_externa_proyecto" do
    assert_difference('OrganizacionExternaProyecto.count', -1) do
      delete :destroy, id: @organizacion_externa_proyecto
    end

    assert_redirected_to organizacion_externa_proyectos_path
  end
end
