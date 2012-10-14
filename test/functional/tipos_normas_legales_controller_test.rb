require 'test_helper'

class TiposNormasLegalesControllerTest < ActionController::TestCase
  setup do
    @tipo_norma_legal = tipos_normas_legales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_normas_legales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_norma_legal" do
    assert_difference('TipoNormaLegal.count') do
      post :create, :tipo_norma_legal => { :deleted_at => @tipo_norma_legal.deleted_at, :tipo_norma_legal_descripcion => @tipo_norma_legal.tipo_norma_legal_descripcion }
    end

    assert_redirected_to tipo_norma_legal_path(assigns(:tipo_norma_legal))
  end

  test "should show tipo_norma_legal" do
    get :show, :id => @tipo_norma_legal
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tipo_norma_legal
    assert_response :success
  end

  test "should update tipo_norma_legal" do
    put :update, :id => @tipo_norma_legal, :tipo_norma_legal => { :deleted_at => @tipo_norma_legal.deleted_at, :tipo_norma_legal_descripcion => @tipo_norma_legal.tipo_norma_legal_descripcion }
    assert_redirected_to tipo_norma_legal_path(assigns(:tipo_norma_legal))
  end

  test "should destroy tipo_norma_legal" do
    assert_difference('TipoNormaLegal.count', -1) do
      delete :destroy, :id => @tipo_norma_legal
    end

    assert_redirected_to tipos_normas_legales_path
  end
end
