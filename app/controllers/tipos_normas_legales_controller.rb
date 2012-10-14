class TiposNormasLegalesController < ApplicationController
  # GET /tipos_normas_legales
  # GET /tipos_normas_legales.json
  def index
    #@tipos_normas_legales = TipoNormaLegal.all
    if params[:txtbuscar].blank?
      @tipos_normas_legales = TipoNormaLegal.paginate(:page => params[:page], :order => "tipo_norma_legal_descripcion")
    else
      @tipos_normas_legales = TipoNormaLegal.paginate(:page => params[:page], :conditions=> ['lower(tipo_norma_legal_descripcion) like lower(?)','%'+params[:txtbuscar]+'%'],:order => "tipo_norma_legal_descripcion")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tipos_normas_legales }
    end
  end

  # GET /tipos_normas_legales/1
  # GET /tipos_normas_legales/1.json
  def show
    @tipo_norma_legal = TipoNormaLegal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tipo_norma_legal }
    end
  end

  # GET /tipos_normas_legales/new
  # GET /tipos_normas_legales/new.json
  def new
    @tipo_norma_legal = TipoNormaLegal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @tipo_norma_legal }
    end
  end

  # GET /tipos_normas_legales/1/edit
  def edit
    @tipo_norma_legal = TipoNormaLegal.find(params[:id])
  end

  # POST /tipos_normas_legales
  # POST /tipos_normas_legales.json
  def create
    @tipo_norma_legal = TipoNormaLegal.new(params[:tipo_norma_legal])

    respond_to do |format|
      if @tipo_norma_legal.save
        format.html { redirect_to @tipo_norma_legal, :notice => 'El Tipo de Norma Legal ha sido creada exitosamente.' }
        format.json { render :json => @tipo_norma_legal, :status => :created, :location => @tipo_norma_legal }
      else
        format.html { render :action => "new" }
        format.json { render :json => @tipo_norma_legal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipos_normas_legales/1
  # PUT /tipos_normas_legales/1.json
  def update
    @tipo_norma_legal = TipoNormaLegal.find(params[:id])

    respond_to do |format|
      if @tipo_norma_legal.update_attributes(params[:tipo_norma_legal])
        format.html { redirect_to @tipo_norma_legal, :notice => 'El Tipo de Norma Legal ha sido actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @tipo_norma_legal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_normas_legales/1
  # DELETE /tipos_normas_legales/1.json
  def destroy
    @tipo_norma_legal = TipoNormaLegal.find(params[:id])
    @tipo_norma_legal.destroy
    flash[:info] = "Tipo de Nomra Legal eliminada correctamente."

    respond_to do |format|
      format.html { redirect_to tipos_normas_legales_url }
      format.json { head :no_content }
    end
  end
end
