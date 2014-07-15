require 'test_helper'

class NotificacionEmailesControllerTest < ActionController::TestCase
  setup do
    @notificacion_email = notificacion_emailes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notificacion_emailes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notificacion_email" do
    assert_difference('NotificacionEmail.count') do
      post :create, notificacion_email: { asunto: @notificacion_email.asunto, destinatario: @notificacion_email.destinatario, remitente: @notificacion_email.remitente }
    end

    assert_redirected_to notificacion_email_path(assigns(:notificacion_email))
  end

  test "should show notificacion_email" do
    get :show, id: @notificacion_email
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notificacion_email
    assert_response :success
  end

  test "should update notificacion_email" do
    patch :update, id: @notificacion_email, notificacion_email: { asunto: @notificacion_email.asunto, destinatario: @notificacion_email.destinatario, remitente: @notificacion_email.remitente }
    assert_redirected_to notificacion_email_path(assigns(:notificacion_email))
  end

  test "should destroy notificacion_email" do
    assert_difference('NotificacionEmail.count', -1) do
      delete :destroy, id: @notificacion_email
    end

    assert_redirected_to notificacion_emailes_path
  end
end
