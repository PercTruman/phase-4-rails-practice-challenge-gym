class GymsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

rescue_from 
    def show
        gym = gym.find(params[:id])
        render json: gym, status: :ok
    end

    def destroy
        gym = gym.find(params[:id])
        gym.destroy
        head :no_content, status: :ok
    end

    private

    def render_not_found(error)
        render json: {error: "#{error.model} not found"}, status: :not_found
    end
end
