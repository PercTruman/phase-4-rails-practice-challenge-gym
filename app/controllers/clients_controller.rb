class ClientsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def show
        client = client.find(params[:id])
        render json: client, status: :ok
    end

    private

    def render_not_found(error)
        render json: {error: "#{error.model} not found"}, status: :not_found
    end
end
