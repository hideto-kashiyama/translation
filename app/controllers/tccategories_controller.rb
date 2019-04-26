class TccategoriesController < ApplicationController
  before_action :set_tccategory, only: [:show, :edit, :update, :destroy]

  # GET /tccategories
  # GET /tccategories.json
  def index
    @tccategories = Tccategory.all
  end

  # GET /tccategories/1
  # GET /tccategories/1.json
  def show
  end

  # GET /tccategories/new
  def new
    @tccategory = Tccategory.new
  end

  # GET /tccategories/1/edit
  def edit
  end

  # POST /tccategories
  # POST /tccategories.json
  def create
    @tccategory = Tccategory.new(tccategory_params)

    respond_to do |format|
      if @tccategory.save
        format.html { redirect_to @tccategory, notice: 'Tccategory was successfully created.' }
        format.json { render :show, status: :created, location: @tccategory }
      else
        format.html { render :new }
        format.json { render json: @tccategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tccategories/1
  # PATCH/PUT /tccategories/1.json
  def update
    respond_to do |format|
      if @tccategory.update(tccategory_params)
        format.html { redirect_to @tccategory, notice: 'Tccategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @tccategory }
      else
        format.html { render :edit }
        format.json { render json: @tccategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tccategories/1
  # DELETE /tccategories/1.json
  def destroy
    @tccategory.destroy
    respond_to do |format|
      format.html { redirect_to tccategories_url, notice: 'Tccategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tccategory
      @tccategory = Tccategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tccategory_params
      params.require(:tccategory).permit(:ctg, :bunrui_id)
    end
end
