require 'test_helper'

class ExperienciaControllerTest < ActionController::TestCase
  setup do
    @experiencium = experiencia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiencium" do
    assert_difference('Experiencium.count') do
      post :create, experiencium: { cantidadExperiencia: @experiencium.cantidadExperiencia, habilidad_id: @experiencium.habilidad_id, tieneExperiencia: @experiencium.tieneExperiencia, voluntario_id: @experiencium.voluntario_id }
    end

    assert_redirected_to experiencium_path(assigns(:experiencium))
  end

  test "should show experiencium" do
    get :show, id: @experiencium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experiencium
    assert_response :success
  end

  test "should update experiencium" do
    patch :update, id: @experiencium, experiencium: { cantidadExperiencia: @experiencium.cantidadExperiencia, habilidad_id: @experiencium.habilidad_id, tieneExperiencia: @experiencium.tieneExperiencia, voluntario_id: @experiencium.voluntario_id }
    assert_redirected_to experiencium_path(assigns(:experiencium))
  end

  test "should destroy experiencium" do
    assert_difference('Experiencium.count', -1) do
      delete :destroy, id: @experiencium
    end

    assert_redirected_to experiencia_path
  end
end
