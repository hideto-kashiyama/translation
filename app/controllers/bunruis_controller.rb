class BunruisController < ApplicationController
  before_action :set_bunrui, only: [:show, :edit, :update, :destroy]

  # GET /bunruis
  # GET /bunruis.json
  def index
    @bunruis = Bunrui.all
  end

  # GET /bunruis/1
  # GET /bunruis/1.json
  def show
  end

  # GET /bunruis/new
  def new
    @bunrui = Bunrui.new
  end

  # GET /bunruis/1/edit
  def edit
  end

  # POST /bunruis
  # POST /bunruis.json
  def create
    @bunrui = Bunrui.new(bunrui_params)

    respond_to do |format|
      if @bunrui.save
        format.html { redirect_to @bunrui, notice: 'Bunrui was successfully created.' }
        format.json { render :show, status: :created, location: @bunrui }
      else
        format.html { render :new }
        format.json { render json: @bunrui.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bunruis/1
  # PATCH/PUT /bunruis/1.json
  def update
    respond_to do |format|
      if @bunrui.update(bunrui_params)
        format.html { redirect_to @bunrui, notice: 'Bunrui was successfully updated.' }
        format.json { render :show, status: :ok, location: @bunrui }
      else
        format.html { render :edit }
        format.json { render json: @bunrui.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bunruis/1
  # DELETE /bunruis/1.json
  def destroy
    @bunrui.destroy
    respond_to do |format|
      format.html { redirect_to bunruis_url, notice: 'Bunrui was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bunrui
      @bunrui = Bunrui.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bunrui_params
      params.require(:bunrui).permit(:bunrui)
    end
end
