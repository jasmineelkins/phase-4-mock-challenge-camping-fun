class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_response
    # GET /signups
    # def index
    #     all_signups = Signup.all
    #     render json: all_signups
    # end

    # POST /signups
    def create
        new_signup = Signup.create!(signup_params)
        
        if new_signup
            render json: new_signup.activity, status: :created
        else
            render json: {error: new_signup.errors.full_messages}, status: :unprocessable_entity
        end
    end


    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def render_unprocessable_response(invalid)
        render json: {errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
