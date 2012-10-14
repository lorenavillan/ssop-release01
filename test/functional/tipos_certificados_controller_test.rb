require 'test_helper'

class TiposCertificadosControllerTest < ActionController::TestCase
  setup do
    @tipo_certificado = tipos_certificados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_certificados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_certificado" do
    assert_difference('TipoCertificado.count') do
      post :create, :tipo_certificado => { :deleted_at => @tipo_certificado.deleted_at, :tipo_certificado_descripcion => @tipo_certificado.tipo_certificado_descripcion }
    end

    assert_redirected_to tipo_certificado_path(assigns(:tipo_certificado))
  end

  test "should show tipo_certificado" do
    get :show, :id => @tipo_certificado
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tipo_certificado
    assert_response :success
  end

  test "should update tipo_certificado" do
    put :update, :id => @tipo_certificado, :tipo_certificado => { :deleted_at => @tipo_certificado.deleted_at, :tipo_certificado_descripcion => @tipo_certificado.tipo_certificado_descripcion }
    assert_redirected_to tipo_certificado_path(assigns(:tipo_certificado))
  end

  test "should destroy tipo_certificado" do
    assert_difference('TipoCertificado.count', -1) do
      delete :destroy, :id => @tipo_certificado
    end

    assert_redirected_to tipos_certificados_path
  end
end
