class ActivitiesController < ApplicationController
    # GET /activities
    def index
        all_activities = Activity.all
        render json: all_activities
    end


    # DELETE /activities/:id
    def destroy
        activity = Activity.find_by(id: params[:id])
        if activity
            activity.destroy
            render json: {}, status: :ok
        else
            render json: {error: "Activity not found"}, status: :not_found
        end
    end

end
