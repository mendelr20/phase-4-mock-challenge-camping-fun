class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper.to_json(include: [activities: {only: [:name,:difficulty,:id]}])
        else
            render json: {error: "Camper not found"}, status: :not_found
        end
    end

    def create
        camper = Camper.create(camp_params)
        if camper.valid?
            render json: camper, status: :created
        else
            render json: {errors: ["validation have not been met"] }, status: :unprocessable_entity
        end
    end


    private

    def render_not_found_response
        render json: { error: 'Activity not found' }, status: :not_found
    end
    def render_invalid_response
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def camp_params
        params.permit(:name, :age)
    end
end
