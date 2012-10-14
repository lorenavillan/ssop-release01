class ContratosController < ApplicationController
  # GET /contratos
  # GET /contratos.json
  def index
    #@contratos = Contrato.all
    if params[:txtbuscar].blank?
      @contratos = Contrato.paginate(:page => params[:page], :order => "contrato_nombre_obra")
    else
      @contratos = Contrato.paginate(:page => params[:page], :conditions=> ['lower(contrato_nombre_obra) like lower(?)','%'+params[:txtbuscar]+'%'],:order => "contrato_nombre_obra")
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @contratos }
    end
  end

  # GET /contratos/1
  # GET /contratos/1.json
  def show
    @contrato = Contrato.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @contrato }
    end
  end

  # GET /contratos/new
  # GET /contratos/new.json
  def new
    @contrato = Contrato.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @contrato }
    end
  end

  # GET /contratos/1/edit
  def edit
    @contrato = Contrato.find(params[:id])
  end

  # POST /contratos
  # POST /contratos.json
  def create
    @contrato = Contrato.new(params[:contrato])
    @contrato.contrato_fecha = Date.strptime(params[:contrato][:contrato_fecha],'%d/%m/%Y') if params[:contrato][:contrato_fecha]
    respond_to do |format|
      if @contrato.save
        format.html { redirect_to @contrato, :notice => 'Contrato creado exitosamente.' }
        format.json { render :json => @contrato, :status => :created, :location => @contrato }
      else
        format.html { render :action => "new" }
        format.json { render :json => @contrato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contratos/1
  # PUT /contratos/1.json
  def update
    @contrato = Contrato.find(params[:id])
    params[:contrato][:contrato_fecha] = Date.strptime(params[:contrato][:contrato_fecha],'%d/%m/%Y')
    respond_to do |format|
      if @contrato.update_attributes(params[:contrato])
        format.html { redirect_to @contrato, :notice => 'Contrato actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @contrato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contratos/1
  # DELETE /contratos/1.json
  def destroy
    @contrato = Contrato.find(params[:id])
    @contrato.destroy

    respond_to do |format|
      format.html { redirect_to contratos_url }
      format.json { head :no_content }
    end
  end
####
  def todos #busqueda del autocomplete
      @contratos_aux=Contrato.where("contrato_nombre_obra ilike ?","%#{params[:term]}%").limit(10)
      @contratos=[]
      @contratos_aux.each do |contrato|
        @contratos << contrato.as_json.merge({"contratista_nombre"=>contrato.contratista_nombre,"ubicacion"=>contrato.ubicacion})
      end
      #end
        respond_to do |format|
          format.json{render :json => @contratos.to_json}
        end
  end




####
end #fin de la clase
