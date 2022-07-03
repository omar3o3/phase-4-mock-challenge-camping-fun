class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :camper_not_found

    def index
        activities = Activity.all
        render json: activities, include: []
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
    end

    private
    def camper_not_found
        render json: {error: "Activity not found"}, status: :not_found
    end

end
