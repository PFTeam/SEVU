require 'test_helper'

class ComprobantesControllerTest < ActionController::TestCase
  setup do
    @comprobant = comprobantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comprobantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comprobant" do
    assert_difference('Comprobante.count') do
      post :create, comprobant: { numero: @comprobant.numero }
    end

    assert_redirected_to comprobant_path(assigns(:comprobant))
  end

  test "should show comprobant" do
    get :show, id: @comprobant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comprobant
    assert_response :success
  end

  test "should update comprobant" do
    patch :update, id: @comprobant, comprobant: { numero: @comprobant.numero }
    assert_redirected_to comprobant_path(assigns(:comprobant))
  end

  test "should destroy comprobant" do
    assert_difference('Comprobante.count', -1) do
      delete :destroy, id: @comprobant
    end

    assert_redirected_to comprobantes_path
  end
end
