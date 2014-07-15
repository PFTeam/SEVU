require 'test_helper'

class ObjetivoEspecificosControllerTest < ActionController::TestCase
  setup do
    @objetivo_especifico = objetivo_especificos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:objetivo_especificos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create objetivo_especifico" do
    assert_difference('ObjetivoEspecifico.count') do
      post :create, objetivo_especifico: { descripcion: @objetivo_especifico.descripcion, objetivo_general_id: @objetivo_especifico.objetivo_general_id, titulo: @objetivo_especifico.titulo }
    end

    assert_redirected_to objetivo_especifico_path(assigns(:objetivo_especifico))
  end

  test "should show objetivo_especifico" do
    get :show, id: @objetivo_especifico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @objetivo_especifico
    assert_response :success
  end

  test "should update objetivo_especifico" do
    patch :update, id: @objetivo_especifico, objetivo_especifico: { descripcion: @objetivo_especifico.descripcion, objetivo_general_id: @objetivo_especifico.objetivo_general_id, titulo: @objetivo_especifico.titulo }
    assert_redirected_to objetivo_especifico_path(assigns(:objetivo_especifico))
  end

  test "should destroy objetivo_especifico" do
    assert_difference('ObjetivoEspecifico.count', -1) do
      delete :destroy, id: @objetivo_especifico
    end

    assert_redirected_to objetivo_especificos_path
  end
end
