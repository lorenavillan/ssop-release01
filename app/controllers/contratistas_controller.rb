class ContratistasController < ApplicationController
  # GET /contratistas
  # GET /contratistas.json
  def index
    #@contratistas = Contratista.all
    if params[:txtbuscar].blank?
      @contratistas = Contratista.paginate(:page => params[:page], :order => "contratista_nombre")
    else
      @contratistas = Contratista.paginate(:page => params[:page], :conditions=> ['lower(contratista_nombre) like lower(?)','%'+params[:txtbuscar]+'%'],:order => "contratista_nombre")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @contratistas }
    end
  end

  # GET /contratistas/1
  # GET /contratistas/1.json
  def show
    @contratista = Contratista.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @contratista }
    end
  end

  # GET /contratistas/new
  # GET /contratistas/new.json
  def new
    @contratista = Contratista.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @contratista }
    end
  end

  # GET /contratistas/1/edit
  def edit
    @contratista = Contratista.find(params[:id])
  end

  # POST /contratistas
  # POST /contratistas.json
  def create
    @contratista = Contratista.new(params[:contratista])

    respond_to do |format|
      if @contratista.save
        format.html { redirect_to @contratista, :notice => 'El contratista ha sido creadado exitosamente.' }
        format.json { render :json => @contratista, :status => :created, :location => @contratista }
      else
        format.html { render :action => "new" }
        format.json { render :json => @contratista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contratistas/1
  # PUT /contratistas/1.json
  def update
    @contratista = Contratista.find(params[:id])

    respond_to do |format|
      if @contratista.update_attributes(params[:contratista])
        format.html { redirect_to @contratista, :notice => 'El contratista ha sido actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @contratista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contratistas/1
  # DELETE /contratistas/1.json
  def destroy
    @contratista = Contratista.find(params[:id])
    @contratista.destroy
    flash[:info] = "Contratista eliminado correctamente."

    respond_to do |format|
      format.html { redirect_to contratistas_url }
      format.json { head :no_content }
    end
  end
####
def todos_contratistas #busqueda del autocomplete contratistas
      @contratistas=[]
      @contratistas_aux=Contratista.where("empresa ilike ?","%#{params[:term]}%").limit(10)
      @contratistas_aux.each do |cont|
      @contratistas << {
            "id"=>cont.id,
            "contratista_empresa"=>cont.empresa
      }
      end
      respond_to do |format|
        format.json{render :json => @contratistas.to_json}
      end
end





####




end #fin de la clase
