class TiposCertificadosController < ApplicationController
  # GET /tipos_certificados
  # GET /tipos_certificados.json
  def index
    #@tipos_certificados = TipoCertificado.all
    if params[:txtbuscar].blank?
      @tipos_certificados = TipoCertificado.paginate(:page => params[:page], :order => "tipo_certificado_descripcion")
    else
      @tipos_certificados = TipoCertificado.paginate(:page => params[:page], :conditions=> ['lower(tipo_certificado_descripcion) like lower(?)','%'+params[:txtbuscar]+'%'],:order => "tipo_certificado_descripcion")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tipos_certificados }
    end
  end

  # GET /tipos_certificados/1
  # GET /tipos_certificados/1.json
  def show
    @tipo_certificado = TipoCertificado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tipo_certificado }
    end
  end

  # GET /tipos_certificados/new
  # GET /tipos_certificados/new.json
  def new
    @tipo_certificado = TipoCertificado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @tipo_certificado }
    end
  end

  # GET /tipos_certificados/1/edit
  def edit
    @tipo_certificado = TipoCertificado.find(params[:id])
  end

  # POST /tipos_certificados
  # POST /tipos_certificados.json
  def create
    @tipo_certificado = TipoCertificado.new(params[:tipo_certificado])

    respond_to do |format|
      if @tipo_certificado.save
        format.html { redirect_to @tipo_certificado, :notice => 'El tipo de certificado ha sido creado exitosamente.' }
        format.json { render :json => @tipo_certificado, :status => :created, :location => @tipo_certificado }
      else
        format.html { render :action => "new" }
        format.json { render :json => @tipo_certificado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipos_certificados/1
  # PUT /tipos_certificados/1.json
  def update
    @tipo_certificado = TipoCertificado.find(params[:id])

    respond_to do |format|
      if @tipo_certificado.update_attributes(params[:tipo_certificado])
        format.html { redirect_to @tipo_certificado, :notice => 'El tipo de certificado ha sido actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @tipo_certificado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_certificados/1
  # DELETE /tipos_certificados/1.json
  def destroy
    @tipo_certificado = TipoCertificado.find(params[:id])
    @tipo_certificado.destroy
    flash[:info] = "Tipo de Certificado eliminado correctamente."

    respond_to do |format|
      format.html { redirect_to tipos_certificados_url }
      format.json { head :no_content }
    end
  end
end
