class QuestionDataPointsController < ApiController
  before_action :set_question_data_point, only: [:show, :update, :destroy]

  # GET /question_data_points
  def index
    @question_data_points = QuestionDataPoint.all

    render json: @question_data_points
  end

  # GET /question_data_points/1
  def show
    render json: @question_data_point
  end

  # POST /question_data_points
  def create
    @question_data_point = QuestionDataPoint.new(question_data_point_params)

    if @question_data_point.save
      render json: @question_data_point, status: :created, location: @question_data_point
    else
      render json: @question_data_point.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /question_data_points/1
  def update
    if @question_data_point.update(question_data_point_params)
      render json: @question_data_point
    else
      render json: @question_data_point.errors, status: :unprocessable_entity
    end
  end

  # DELETE /question_data_points/1
  def destroy
    @question_data_point.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_data_point
      @question_data_point = QuestionDataPoint.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_data_point_params
      params.require(:question_data_point).permit(:question_id, :data_point_id)
    end
end
