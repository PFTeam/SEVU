require 'test_helper'

class NotasControllerTest < ActionController::TestCase
  setup do
    @nota = notas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nota" do
    assert_difference('Nota.count') do
      post :create, nota: { descripcion: @nota.descripcion, fechaCreacion: @nota.fechaCreacion, titulo: @nota.titulo, usuario_id: @nota.usuario_id, voluntario_id: @nota.voluntario_id }
    end

    assert_redirected_to nota_path(assigns(:nota))
  end

  test "should show nota" do
    get :show, id: @nota
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nota
    assert_response :success
  end

  test "should update nota" do
    patch :update, id: @nota, nota: { descripcion: @nota.descripcion, fechaCreacion: @nota.fechaCreacion, titulo: @nota.titulo, usuario_id: @nota.usuario_id, voluntario_id: @nota.voluntario_id }
    assert_redirected_to nota_path(assigns(:nota))
  end

  test "should destroy nota" do
    assert_difference('Nota.count', -1) do
      delete :destroy, id: @nota
    end

    assert_redirected_to notas_path
  end
end
