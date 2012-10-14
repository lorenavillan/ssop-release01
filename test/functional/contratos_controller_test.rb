require 'test_helper'

class ContratosControllerTest < ActionController::TestCase
  setup do
    @contrato = contratos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contratos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contrato" do
    assert_difference('Contrato.count') do
      post :create, :contrato => { :contratista_id => @contrato.contratista_id, :contrato_anio_norma_legal => @contrato.contrato_anio_norma_legal, :contrato_expte => @contrato.contrato_expte, :contrato_fecha => @contrato.contrato_fecha, :contrato_monto => @contrato.contrato_monto, :contrato_nombre_obra => @contrato.contrato_nombre_obra, :contrato_nro_norma_legal => @contrato.contrato_nro_norma_legal, :contrato_plazo_obra => @contrato.contrato_plazo_obra, :deleted_at => @contrato.deleted_at, :finalizado => @contrato.finalizado, :localidad_id => @contrato.localidad_id, :municipio_id => @contrato.municipio_id, :tipo_norma_legal_id => @contrato.tipo_norma_legal_id }
    end

    assert_redirected_to contrato_path(assigns(:contrato))
  end

  test "should show contrato" do
    get :show, :id => @contrato
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contrato
    assert_response :success
  end

  test "should update contrato" do
    put :update, :id => @contrato, :contrato => { :contratista_id => @contrato.contratista_id, :contrato_anio_norma_legal => @contrato.contrato_anio_norma_legal, :contrato_expte => @contrato.contrato_expte, :contrato_fecha => @contrato.contrato_fecha, :contrato_monto => @contrato.contrato_monto, :contrato_nombre_obra => @contrato.contrato_nombre_obra, :contrato_nro_norma_legal => @contrato.contrato_nro_norma_legal, :contrato_plazo_obra => @contrato.contrato_plazo_obra, :deleted_at => @contrato.deleted_at, :finalizado => @contrato.finalizado, :localidad_id => @contrato.localidad_id, :municipio_id => @contrato.municipio_id, :tipo_norma_legal_id => @contrato.tipo_norma_legal_id }
    assert_redirected_to contrato_path(assigns(:contrato))
  end

  test "should destroy contrato" do
    assert_difference('Contrato.count', -1) do
      delete :destroy, :id => @contrato
    end

    assert_redirected_to contratos_path
  end
end
