class MembershipsController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def create
        membership = Membership.create!(membership_params)
        if Membership.exists?(membership)
            render json: {error: 'membership already exists'}
        else
        render json: membership, status: :created
        end
    end

    private
    
    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end
end
