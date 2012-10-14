class TiposEstadosController < ApplicationController
  # GET /tipos_estados
  # GET /tipos_estados.json
  def index
    #@tipos_estados = TipoEstado.all
    if params[:txtbuscar].blank?
      @tipos_estados = TipoEstado.paginate(:page => params[:page], :order => "tipo_estado_descripcion")
    else
      @tipos_estados = TipoEstado.paginate(:page => params[:page], :conditions=> ['lower(tipo_estado_descripcion) like lower(?)','%'+params[:txtbuscar]+'%'],:order => "tipo_estado_descripcion")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tipos_estados }
    end
  end

  # GET /tipos_estados/1
  # GET /tipos_estados/1.json
  def show
    @tipo_estado = TipoEstado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tipo_estado }
    end
  end

  # GET /tipos_estados/new
  # GET /tipos_estados/new.json
  def new
    @tipo_estado = TipoEstado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @tipo_estado }
    end
  end

  # GET /tipos_estados/1/edit
  def edit
    @tipo_estado = TipoEstado.find(params[:id])
  end

  # POST /tipos_estados
  # POST /tipos_estados.json
  def create
    @tipo_estado = TipoEstado.new(params[:tipo_estado])

    respond_to do |format|
      if @tipo_estado.save
        format.html { redirect_to @tipo_estado, :notice => 'El tipo de estado de obra ha sido creado exitosamente.' }
        format.json { render :json => @tipo_estado, :status => :created, :location => @tipo_estado }
      else
        format.html { render :action => "new" }
        format.json { render :json => @tipo_estado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipos_estados/1
  # PUT /tipos_estados/1.json
  def update
    @tipo_estado = TipoEstado.find(params[:id])

    respond_to do |format|
      if @tipo_estado.update_attributes(params[:tipo_estado])
        format.html { redirect_to @tipo_estado, :notice => 'El tipo de estado de obra ha sido actuazlizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @tipo_estado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_estados/1
  # DELETE /tipos_estados/1.json
  def destroy
    @tipo_estado = TipoEstado.find(params[:id])
    @tipo_estado.destroy
    flash[:info] = "Tipo de Estado eliminado correctamente."

    respond_to do |format|
      format.html { redirect_to tipos_estados_url }
      format.json { head :no_content }
    end
  end
end
