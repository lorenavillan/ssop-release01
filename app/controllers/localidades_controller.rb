class LocalidadesController < ApplicationController
  # GET /localidades
  # GET /localidades.json
  def index
    #@localidades = Localidad.all
     if params[:txtbuscar].blank?
      @localidades = Localidad.paginate(:page => params[:page], :order => "nombre")
    else
      @localidades = Localidad.paginate(:page => params[:page], :conditions=> ['lower(nombre) like lower(?)','%'+params[:txtbuscar]+'%'],:order => "nombre")
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @localidades }
    end
  end

  # GET /localidades/1
  # GET /localidades/1.json
  def show
    @localidad = Localidad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @localidad }
    end
  end

  # GET /localidades/new
  # GET /localidades/new.json
  def new
    @localidad = Localidad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @localidad }
    end
  end

  # GET /localidades/1/edit
  def edit
    @localidad = Localidad.find(params[:id])
  end

  # POST /localidades
  # POST /localidades.json
  def create
    @localidad = Localidad.new(params[:localidad])
    #raise 'error'

    respond_to do |format|
      if @localidad.save
        format.html { redirect_to @localidad, :notice => 'La Localidad fue creada exitosamente.' }
        format.json { render :json => @localidad, :status => :created, :location => @localidad }
      else
        format.html { render :action => "new" }
        format.json { render :json => @localidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /localidades/1
  # PUT /localidades/1.json
  def update
    @localidad = Localidad.find(params[:id])

    respond_to do |format|
      if @localidad.update_attributes(params[:localidad])
        format.html { redirect_to @localidad, :notice => 'La Localidad fue actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @localidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /localidades/1
  # DELETE /localidades/1.json
  def destroy
    @localidad = Localidad.find(params[:id])
    @localidad.destroy
    flash[:info] = "Localidad eliminada correctamente."

    respond_to do |format|
      format.html { redirect_to localidades_url }
      format.json { head :no_content }
    end
  end
end
