class BasicModelsController < ApplicationController
  before_action :set_basic_model, only: [:show, :update, :destroy]

  # GET /basic_models
  def index
    @basic_models = BasicModel.all

    render json: @basic_models
  end

  # GET /basic_models/1
  def show
    render json: @basic_model
  end

  # POST /basic_models
  def create
    @basic_model = BasicModel.new(basic_model_params)

    if @basic_model.save
      render json: @basic_model, status: :created, location: @basic_model
    else
      render json: @basic_model.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /basic_models/1
  def update
    if @basic_model.update(basic_model_params)
      render json: @basic_model
    else
      render json: @basic_model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /basic_models/1
  def destroy
    @basic_model.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic_model
      @basic_model = BasicModel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def basic_model_params
      params.require(:basic_model).permit(:name, :description)
    end
end
