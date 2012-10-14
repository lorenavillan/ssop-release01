require 'test_helper'

class TiposEstadosControllerTest < ActionController::TestCase
  setup do
    @tipo_estado = tipos_estados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_estados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_estado" do
    assert_difference('TipoEstado.count') do
      post :create, :tipo_estado => { :deleted_at => @tipo_estado.deleted_at, :tipo_estado_descripcion => @tipo_estado.tipo_estado_descripcion }
    end

    assert_redirected_to tipo_estado_path(assigns(:tipo_estado))
  end

  test "should show tipo_estado" do
    get :show, :id => @tipo_estado
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tipo_estado
    assert_response :success
  end

  test "should update tipo_estado" do
    put :update, :id => @tipo_estado, :tipo_estado => { :deleted_at => @tipo_estado.deleted_at, :tipo_estado_descripcion => @tipo_estado.tipo_estado_descripcion }
    assert_redirected_to tipo_estado_path(assigns(:tipo_estado))
  end

  test "should destroy tipo_estado" do
    assert_difference('TipoEstado.count', -1) do
      delete :destroy, :id => @tipo_estado
    end

    assert_redirected_to tipos_estados_path
  end
end
