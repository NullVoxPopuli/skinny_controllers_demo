class BasicModelsController < ApplicationController
  include SkinnyControllers::Diet

  def index
    render json: model
  end

  def show
    render json: model
  end

  def create
    render json: model, status: 201
  end

  def update
    render json: model
  end

  def destroy
    # normally, we'd do this, but the existing tests require a 204
    # render json: model
    # this technically violates what 204 in intended for
    render json: model, status: 204
    # an alternative could be to either not user 204, or to call model
    # before the call to render
  end

  private

    # Only allow a trusted parameter "white list" through.
    def update_basic_model_params
      params.require(:basic_model).permit(:name, :description)
    end
end
