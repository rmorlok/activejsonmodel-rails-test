class PolygonsController < ApplicationController
  before_action :set_polygon, only: %i[ show edit update destroy ]

  # GET /polygons or /polygons.json
  def index
    @polygons = Polygon.all
  end

  # GET /polygons/1 or /polygons/1.json
  def show
  end

  # GET /polygons/new
  def new
    @polygon = Polygon.new
  end

  # GET /polygons/1/edit
  def edit
  end

  # POST /polygons or /polygons.json
  def create
    @polygon = Polygon.new(polygon_params)

    respond_to do |format|
      if @polygon.save
        format.html { redirect_to polygon_url(@polygon), notice: "Polygon was successfully created." }
        format.json { render :show, status: :created, location: @polygon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @polygon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polygons/1 or /polygons/1.json
  def update
    respond_to do |format|
      if @polygon.update(polygon_params)
        format.html { redirect_to polygon_url(@polygon), notice: "Polygon was successfully updated." }
        format.json { render :show, status: :ok, location: @polygon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @polygon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polygons/1 or /polygons/1.json
  def destroy
    @polygon.destroy

    respond_to do |format|
      format.html { redirect_to polygons_url, notice: "Polygon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_polygon
      @polygon = Polygon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def polygon_params
      params.require(:polygon).permit(:name)
    end
end
