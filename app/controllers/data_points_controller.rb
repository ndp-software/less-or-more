class DataPointsController < ApiController
  before_action :set_data_point, only: [:show, :update, :destroy]

  # GET /data_points
  def index
    @data_points = DataPoint.all

    render json: @data_points
  end

  # GET /data_points/1
  def show
    render json: @data_point
  end

  # POST /data_points
  def create
    @data_point = DataPoint.new(data_point_params)

    if @data_point.save
      render json: @data_point, status: :created, location: @data_point
    else
      render json: @data_point.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /data_points/1
  def update
    if @data_point.update(data_point_params)
      render json: @data_point
    else
      render json: @data_point.errors, status: :unprocessable_entity
    end
  end

  # DELETE /data_points/1
  def destroy
    @data_point.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_point
      @data_point = DataPoint.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def data_point_params
      params.require(:data_point).permit(:data_set, :headline, :description, :value, :unit_code, :reference)
    end
end
