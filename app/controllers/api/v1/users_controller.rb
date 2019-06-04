class API::V1::UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # https://www.rubydoc.info/gems/active_model_serializers/Rails/Generators
  def index
    users = User.all
    render json: users, each_serializer: UserSerializer, adapter: :json_api, status: 200
  end

  def show
    user = User.find(params[:id])
    render json: user, serializer: UserSerializer, adapter: :json_api, status: 200
  end

  def create
    user = User.new(user_params)
    render json: user, serializer: UserSerializer, adapter: :json_api, status: 200 if user.save!
  end

  def update
    user = User.find(params[:id])
    render json: user, serializer: UserSerializer, adapter: :json_api, status: 200 if user.update(user_params)
  end

  def destroy
    user = User.find(params[:id])
    render json: user, serializer: UserSerializer, adapter: :json_api, status: 200 if user.destroy!
  end

  private

  def record_not_found
    render json: { message: 'Record Not Found!'}, adapter: :json_api, status: 404
  end

end
