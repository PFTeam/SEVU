require 'test_helper'

class ObjetivoGeneralsControllerTest < ActionController::TestCase
  setup do
    @objetivo_general = objetivo_generals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:objetivo_generals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create objetivo_general" do
    assert_difference('ObjetivoGeneral.count') do
      post :create, objetivo_general: { description: @objetivo_general.description, proyecto_id: @objetivo_general.proyecto_id, titulo: @objetivo_general.titulo }
    end

    assert_redirected_to objetivo_general_path(assigns(:objetivo_general))
  end

  test "should show objetivo_general" do
    get :show, id: @objetivo_general
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @objetivo_general
    assert_response :success
  end

  test "should update objetivo_general" do
    patch :update, id: @objetivo_general, objetivo_general: { description: @objetivo_general.description, proyecto_id: @objetivo_general.proyecto_id, titulo: @objetivo_general.titulo }
    assert_redirected_to objetivo_general_path(assigns(:objetivo_general))
  end

  test "should destroy objetivo_general" do
    assert_difference('ObjetivoGeneral.count', -1) do
      delete :destroy, id: @objetivo_general
    end

    assert_redirected_to objetivo_generals_path
  end
end
