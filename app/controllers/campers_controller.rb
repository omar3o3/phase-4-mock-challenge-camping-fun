class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :camper_not_found
rescue_from ActiveRecord::RecordInvalid, with: :camper_invalid

    def index
        campers = Camper.all
        render json: campers, include: []
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, include: ['activities']
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end


    private

    def camper_not_found
        render json: {error: 'Camper not found'}, status: :not_found
    end

    def camper_params
        params.permit(:name, :age)
    end

    def camper_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
