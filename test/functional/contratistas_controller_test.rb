require 'test_helper'

class ContratistasControllerTest < ActionController::TestCase
  setup do
    @contratista = contratistas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contratistas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contratista" do
    assert_difference('Contratista.count') do
      post :create, :contratista => { :contratista_apellido => @contratista.contratista_apellido, :contratista_cuit => @contratista.contratista_cuit, :contratista_domicilio_legal => @contratista.contratista_domicilio_legal, :contratista_email => @contratista.contratista_email, :contratista_nombre => @contratista.contratista_nombre, :contratista_telefono => @contratista.contratista_telefono, :deleted_at => @contratista.deleted_at, :empresa => @contratista.empresa }
    end

    assert_redirected_to contratista_path(assigns(:contratista))
  end

  test "should show contratista" do
    get :show, :id => @contratista
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contratista
    assert_response :success
  end

  test "should update contratista" do
    put :update, :id => @contratista, :contratista => { :contratista_apellido => @contratista.contratista_apellido, :contratista_cuit => @contratista.contratista_cuit, :contratista_domicilio_legal => @contratista.contratista_domicilio_legal, :contratista_email => @contratista.contratista_email, :contratista_nombre => @contratista.contratista_nombre, :contratista_telefono => @contratista.contratista_telefono, :deleted_at => @contratista.deleted_at, :empresa => @contratista.empresa }
    assert_redirected_to contratista_path(assigns(:contratista))
  end

  test "should destroy contratista" do
    assert_difference('Contratista.count', -1) do
      delete :destroy, :id => @contratista
    end

    assert_redirected_to contratistas_path
  end
end
