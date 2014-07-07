require 'test_helper'

class NotaPersonalsControllerTest < ActionController::TestCase
  setup do
    @nota_personal = nota_personals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nota_personals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nota_personal" do
    assert_difference('NotaPersonal.count') do
      post :create, nota_personal: { descripcion: @nota_personal.descripcion, fechaCreacion: @nota_personal.fechaCreacion, titulo: @nota_personal.titulo, usuario_id: @nota_personal.usuario_id, voluntario_id: @nota_personal.voluntario_id }
    end

    assert_redirected_to nota_personal_path(assigns(:nota_personal))
  end

  test "should show nota_personal" do
    get :show, id: @nota_personal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nota_personal
    assert_response :success
  end

  test "should update nota_personal" do
    patch :update, id: @nota_personal, nota_personal: { descripcion: @nota_personal.descripcion, fechaCreacion: @nota_personal.fechaCreacion, titulo: @nota_personal.titulo, usuario_id: @nota_personal.usuario_id, voluntario_id: @nota_personal.voluntario_id }
    assert_redirected_to nota_personal_path(assigns(:nota_personal))
  end

  test "should destroy nota_personal" do
    assert_difference('NotaPersonal.count', -1) do
      delete :destroy, id: @nota_personal
    end

    assert_redirected_to nota_personals_path
  end
end
