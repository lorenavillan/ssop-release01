class MunicipiosController < ApplicationController
  # GET /municipios
  # GET /municipios.json
  def index
   #@municipios = Municipio.all
   if params[:txtbuscar].blank?
      @municipios = Municipio.paginate(:page => params[:page], :order => "nombre")
    else
      @municipios = Municipio.paginate(:page => params[:page], :conditions=> ['lower(nombre) like lower(?)','%'+params[:txtbuscar]+'%'],:order => "nombre")
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @municipios }
    end
  end

  # GET /municipios/1
  # GET /municipios/1.json
  def show
    @municipio = Municipio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @municipio }
    end
  end

  # GET /municipios/new
  # GET /municipios/new.json
  def new
    @municipio = Municipio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @municipio }
    end
  end

  # GET /municipios/1/edit
  def edit
    @municipio = Municipio.find(params[:id])
  end

  # POST /municipios
  # POST /municipios.json
  def create
    @municipio = Municipio.new(params[:municipio])

    respond_to do |format|
      if @municipio.save
        format.html { redirect_to @municipio, :notice => 'El municipio ha sido creado exitosamente.' }
        format.json { render :json => @municipio, :status => :created, :location => @municipio }
      else
        format.html { render :action => "new" }
        format.json { render :json => @municipio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /municipios/1
  # PUT /municipios/1.json
  def update
    @municipio = Municipio.find(params[:id])

    respond_to do |format|
      if @municipio.update_attributes(params[:municipio])
        format.html { redirect_to @municipio, :notice => 'El municipio ha sido actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @municipio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /municipios/1
  # DELETE /municipios/1.json

   # def destroy
  def destroy #Controlar Integridad Referencial
    @municipio = Municipio.find(params[:id])
      if @municipio.localidades.find(:all).empty? then
           @municipio.destroy
           redirect_to municipios_url
           flash[:info] = "Municipio eliminado correctamente."
      else
           redirect_to municipios_url
           flash[:error]  = "No se puede eliminar este Municipio ya que posee referencias en otros lugares."
      end
  end



end #fin de la clase
