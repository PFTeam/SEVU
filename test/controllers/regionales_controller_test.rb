require 'test_helper'

class RegionalesControllerTest < ActionController::TestCase
  setup do
    @regional = regionales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regionales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create regional" do
    assert_difference('Regional.count') do
      post :create, regional: { domicilio: @regional.domicilio, nombre: @regional.nombre, nombre_contacto: @regional.nombre_contacto, telefono_contacto: @regional.telefono_contacto }
    end

    assert_redirected_to regional_path(assigns(:regional))
  end

  test "should show regional" do
    get :show, id: @regional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @regional
    assert_response :success
  end

  test "should update regional" do
    patch :update, id: @regional, regional: { domicilio: @regional.domicilio, nombre: @regional.nombre, nombre_contacto: @regional.nombre_contacto, telefono_contacto: @regional.telefono_contacto }
    assert_redirected_to regional_path(assigns(:regional))
  end

  test "should destroy regional" do
    assert_difference('Regional.count', -1) do
      delete :destroy, id: @regional
    end

    assert_redirected_to regionales_path
  end
end
