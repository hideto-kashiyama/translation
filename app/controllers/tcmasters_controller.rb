class TcmastersController < ApplicationController
  before_action :set_tcmaster, only: [:show, :edit, :update, :destroy]

  # GET /tcmasters
  # GET /tcmasters.json
  def index
    @tcmasters = Tcmaster.all
  end

  # GET /tcmasters/1
  # GET /tcmasters/1.json
  def show
  end

  # GET /tcmasters/new
  def new
    @tcmaster = Tcmaster.new
  end

  # GET /tcmasters/1/edit
  def edit
  end

  # POST /tcmasters
  # POST /tcmasters.json
  def create
    @tcmaster = Tcmaster.new(tcmaster_params)

    respond_to do |format|
      if @tcmaster.save
        format.html { redirect_to @tcmaster, notice: 'Tcmaster was successfully created.' }
        format.json { render :show, status: :created, location: @tcmaster }
      else
        format.html { render :new }
        format.json { render json: @tcmaster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tcmasters/1
  # PATCH/PUT /tcmasters/1.json
  def update
    respond_to do |format|
      if @tcmaster.update(tcmaster_params)
        format.html { redirect_to @tcmaster, notice: 'Tcmaster was successfully updated.' }
        format.json { render :show, status: :ok, location: @tcmaster }
      else
        format.html { render :edit }
        format.json { render json: @tcmaster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tcmasters/1
  # DELETE /tcmasters/1.json
  def destroy
    @tcmaster.destroy
    respond_to do |format|
      format.html { redirect_to tcmasters_url, notice: 'Tcmaster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tcmaster
      @tcmaster = Tcmaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tcmaster_params
      params.require(:tcmaster).permit(:j, :e, :tccategory_id, :bunrui_id, :memo, :s_category_id, :kubun)
    end
end
