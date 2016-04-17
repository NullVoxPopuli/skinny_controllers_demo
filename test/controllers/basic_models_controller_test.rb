require 'test_helper'

class BasicModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @basic_model = basic_models(:one)
  end

  test "should get index" do
    get basic_models_url
    assert_response :success
  end

  test "should create basic_model" do
    assert_difference('BasicModel.count') do
      post basic_models_url, params: { basic_model: { description: @basic_model.description, name: @basic_model.name } }
    end

    assert_response 201
  end

  test "should show basic_model" do
    get basic_model_url(@basic_model)
    assert_response :success
  end

  test "should update basic_model" do
    patch basic_model_url(@basic_model), params: { basic_model: { description: @basic_model.description, name: @basic_model.name } }
    assert_response 200
  end

  test "should destroy basic_model" do
    assert_difference('BasicModel.count', -1) do
      delete basic_model_url(@basic_model)
    end

    assert_response 204
  end
end
