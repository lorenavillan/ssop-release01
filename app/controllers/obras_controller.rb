class ObrasController < ApplicationController
  # GET /obras
  # GET /obras.json
  def index
    #@obras = Obra.all
    if params[:txtbuscar].blank?
      @obras = Obra.paginate(:page => params[:page], :order => "id")
    else      
      c = Contrato.where("contrato_nombre_obra ilike ?","%#{params[:txtbuscar]}%")
      @obras = Obra.paginate(:page => params[:page], :conditions => {:contrato_id => c.collect{|px| px.id}})
    
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @obras }
    end
  end

  # GET /obras/1
  # GET /obras/1.json
  def show
    @obra = Obra.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @obra }
    end
  end

  # GET /obras/new
  # GET /obras/new.json
  def new
    @obra = Obra.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @obra }
    end
  end

  # GET /obras/1/edit
  def edit
    @obra = Obra.find(params[:id])
  end

  # POST /obras
  # POST /obras.json
  def create
    @obra = Obra.new(params[:obra])
    @obra.obra_fecha_inicio = Date.strptime(params[:obra][:obra_fecha_inicio],'%d/%m/%Y') if params[:obra][:obra_fecha_inicio]
    @obra.obra_fecha_fin = Date.strptime(params[:obra][:obra_fecha_fin],'%d/%m/%Y') if params[:obra][:obra_fecha_fin]
    #raise 'error'
    respond_to do |format|
      if @obra.save
        format.html { redirect_to @obra, :notice => 'La obra fue creada correctamente.' }
        format.json { render :json => @obra, :status => :created, :location => @obra }
      else
        format.html { render :action => "new" }
        format.json { render :json => @obra.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /obras/1
  # PUT /obras/1.json
  def update
    @obra = Obra.find(params[:id])
    params[:obra][:obra_fecha_inicio] = Date.strptime(params[:obra][:obra_fecha_inicio],'%d/%m/%Y')
    params[:obra][:obra_fecha_fin] = Date.strptime(params[:obra][:obra_fecha_fin],'%d/%m/%Y')
    respond_to do |format|
      if @obra.update_attributes(params[:obra])
        format.html { redirect_to @obra, :notice => 'La obra fue actualizada correctamente.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @obra.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /obras/1
  # DELETE /obras/1.json
  def destroy
    @obra = Obra.find(params[:id])
    @obra.destroy

    respond_to do |format|
      format.html { redirect_to obras_url }
      format.json { head :no_content }
    end
  end
end
